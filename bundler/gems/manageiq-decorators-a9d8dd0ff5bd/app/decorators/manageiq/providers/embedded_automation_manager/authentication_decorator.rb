module ManageIQ::Providers
  class EmbeddedAutomationManager::AuthenticationDecorator < MiqDecorator
    def self.fonticon
      'pficon pficon-locked'
    end

    def quadicon
      {
        :fonticon => fonticon
      }
    end
  end
end
