class ManageIQ::Providers::Kubernetes::ContainerManager::EventParser
  def self.event_to_hash(event, ems_id = nil)
    _log.debug("ems_id: [#{ems_id}] event: [#{event.inspect}]")
    ems_ref_key = case event[:kind]
                  when 'Node'
                    :container_node_ems_ref
                  when 'Pod'
                    :container_group_ems_ref
                  when 'ReplicationController'
                    :container_replicator_ems_ref
                  end

    event_hash = {
      :event_type                => event[:event_type],
      :source                    => 'KUBERNETES',
      :timestamp                 => event[:timestamp],
      :message                   => event[:message],
      :container_node_name       => event[:container_node_name],
      :container_group_name      => event[:container_group_name],
      :container_replicator_name => event[:container_replicator_name],
      :container_namespace       => event[:container_namespace],
      :container_name            => event[:container_name],
      :full_data                 => event,
      :ems_id                    => ems_id,
      :ems_ref                   => event[:event_uid],
    }

    event_hash[ems_ref_key] = event[:uid]

    event_hash
  end
end
