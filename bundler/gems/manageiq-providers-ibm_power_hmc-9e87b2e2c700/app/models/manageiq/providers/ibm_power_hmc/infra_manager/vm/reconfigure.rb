module ManageIQ::Providers::IbmPowerHmc::InfraManager::Vm::Reconfigure
  def reconfigurable?
    host_hmc_managed
  end

  def max_total_vcpus
    # 64 is based on the CEC's CurrentMaximumVirtualProcessorsPerAIXOrLinuxPartition and
    # CurrentMaximumVirtualProcessorsPerVirtualIOServerPartition settings.
    # This can be further reduced by the partition's MaximumVirtualProcessors setting.
    host && try(:processor_share_type) == "dedicated" ? host.cpu_total_cores : 64
  end

  def max_vcpus
    max_total_vcpus
  end

  def max_cpu_cores_per_socket(_total_vcpus = nil)
    1
  end

  def max_memory_mb
    host ? host.hardware.memory_mb : 1_024
  end

  def build_config_spec(options)
    $ibm_power_hmc_log.debug("building spec for #{options}")

    lpar = ext_management_system.with_provider_connection { |connection| provider_object(connection) }

    # Dynamic Reconfiguration requires RMC to be active.
    raise MiqException::MiqVmError, "RMC is not active on target" if lpar.state == "running" && lpar.rmc_state != "active"

    # The HMC does not allow changing the VSWITCH or the VLAN of a client network adapter.
    # It could be done by deleting and recreating the adapter with the same MAC and options.
    raise MiqException::MiqVmError, "Cannot edit existing network adapter" if options.key?(:network_adapter_edit)

    spec = {}
    build_memory_config_spec(lpar, spec, options) if options.key?(:vm_memory)
    build_proc_config_spec(lpar, spec, options) if options.key?(:number_of_cpus)
    build_netadap_create_config_spec(spec, options) if options.key?(:network_adapter_add)
    build_netadap_delete_config_spec(spec, options) if options.key?(:network_adapter_remove)

    spec
  end

  def build_memory_config_spec(lpar, spec, options)
    desired_memory = options[:vm_memory].to_i

    raise MiqException::MiqVmError, "Memory cannot be lower than #{lpar.min_memory} MB"   if desired_memory < lpar.min_memory.to_i
    raise MiqException::MiqVmError, "Memory cannot be greater than #{lpar.max_memory} MB" if desired_memory > lpar.max_memory.to_i

    spec[:desired_memory] = desired_memory
  end

  def build_proc_config_spec(lpar, spec, options)
    if lpar.dedicated == "true"
      min, max = lpar.minimum_procs, lpar.maximum_procs
      attr = :desired_procs
    else
      min, max = lpar.minimum_vprocs, lpar.maximum_vprocs
      attr = :desired_vprocs
    end

    desired_procs = options[:number_of_cpus].to_i

    raise MiqException::MiqVmError, "Processor count cannot be lower than #{min}"   if desired_procs < min.to_i
    raise MiqException::MiqVmError, "Processor count cannot be greater than #{max}" if desired_procs > max.to_i

    spec[attr] = desired_procs
  end

  def build_netadap_create_config_spec(spec, options)
    spec[:netadap_create] = options[:network_adapter_add].map do |adapt|
      # Retrieve LAN attributes from DB.
      switch_ids = HostSwitch.where(:host_id => host.id).pluck(:switch_id)
      lan = Lan.find_by(:name => adapt[:network], :switch_id => switch_ids)
      raise MiqException::MiqVmError, "Network [#{adapt[:network]}] is not available on target" if lan.nil?

      {
        :sys_uuid     => host.ems_ref,
        :vswitch_uuid => lan.switch.uid_ems,
        :attrs        => {:vlan_id => lan.tag}
      }
    end
  end

  def build_netadap_delete_config_spec(spec, options)
    spec[:netadap_delete] = options[:network_adapter_remove].map do |adapt|
      nic = nics.find_by(:address => adapt[:network][:mac])
      raise MiqException::MiqVmError, "Network adapter [#{adapt[:network][:mac]}] is not available on target" if nic.nil?

      nic.uid_ems
    end
  end

  def raw_reconfigure(spec)
    $ibm_power_hmc_log.debug("reconfiguring with spec=#{spec}")

    ext_management_system.with_provider_connection do |connection|
      attrs = spec.slice(:desired_memory, :desired_procs, :desired_vprocs)
      modify_attrs(connection, attrs) unless attrs.empty?

      spec[:netadap_delete].try(:each) do |uuid|
        connection.network_adapter_lpar_delete(ems_ref, uuid)
      end

      spec[:netadap_create].try(:each) do |netadap|
        connection.network_adapter_lpar_create(ems_ref, netadap[:sys_uuid], netadap[:vswitch_uuid], netadap[:attrs])
      end
    end
  end
end
