class ManageIQ::Providers::Nuage::NetworkManager::SecurityGroup < ::SecurityGroup
  include ManageIQ::Providers::Nuage::AnsibleCrudMixin

  supports :delete

  def delete_security_group_queue(userid)
    task_opts = {
      :action => "deleting Security Group for user #{userid}",
      :userid => userid
    }
    queue_opts = {
      :class_name  => self.class.name,
      :method_name => 'delete_security_group',
      :instance_id => id,
      :priority    => MiqQueue::NORMAL_PRIORITY,
      :role        => 'ems_operations',
      :zone        => ext_management_system.my_zone,
      :args        => []
    }
    MiqTask.generic_action_with_callback(task_opts, queue_opts)
  end

  # TODO: move to core
  def delete_security_group
    raw_delete_security_group
  end

  def raw_delete_security_group
    $nuage_log.info("Deleting Security Group (ems_ref = #{ems_ref})")

    response = Ansible::Runner.run(
      ext_management_system.ansible_env_vars,
      ext_management_system.ansible_extra_vars(:id => ems_ref),
      ext_management_system.playbook('remove-policy-group.yml')
    )
    self.class.ansible_raise_for_status(response)

    $nuage_log.info("Done deleting Security Group (ems_ref = #{ems_ref})")
  rescue StandardError => e
    $nuage_log.error("Error deleting Security Group: #{e}")
    raise MiqException::MiqSecurityGroupDeleteError
  end
end
