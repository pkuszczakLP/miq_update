module ManageIQ::Providers::Amazon::CloudManager::Vm::Operations::Power
  extend ActiveSupport::Concern
  included do
    supports_not :pause, :reason => "Pause Operation is not available for Amazon Web Service (AWS) Instances."
    supports_not :suspend
  end

  def raw_start
    with_provider_object(&:start)
    # Temporarily update state for quick UI response until refresh comes along
    self.update!(:raw_power_state => "powering_up")
  end

  def raw_stop
    with_provider_object(&:stop)
    # Temporarily update state for quick UI response until refresh comes along
    self.update!(:raw_power_state => "shutting_down")
  end
end
