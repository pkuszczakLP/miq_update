module ManageIQ::Providers::Redfish
  class ToolbarOverrides::PhysicalServerCenter \
      < ::ApplicationHelper::Toolbar::Override
    button_group(
      "physical_server_policy",
      [
        select(
          :physical_server_lifecycle_choice,
          "fa fa-recycle fa-lg",
          t = N_("Lifecycle"),
          t,
          :enabled => true,
          :items   => [
            button(
              :physical_server_provision,
              "pficon pficon-add-circle-o fa-lg",
              t = N_("Provision Physical Server"),
              t,
              :klass => ApplicationHelper::Button::ButtonWithoutRbacCheck,
              :data  => {
                "function"      => "sendDataWithRx",
                "function-data" => {
                  :controller     => "provider_dialogs",
                  :button         => :physical_server_provision,
                  :modal_title    => N_("Provision Physical Server"),
                  :component_name => "RedfishServerProvisionDialog",
                },
              }
            ),
            button(
              :physical_server_firmware_update,
              "pficon pficon-maintenance fa-lg",
              t = N_("Update Firmware of Physical Server"),
              t,
              :klass => ApplicationHelper::Button::ButtonWithoutRbacCheck,
              :data  => {
                "function"      => "sendDataWithRx",
                "function-data" => {
                  :controller     => "provider_dialogs",
                  :button         => :physical_server_firmware_update,
                  :modal_title    => N_("Update Physical Server Firmware"),
                  :component_name => "RedfishServerFirmwareUpdateDialog",
                },
              }
            ),
          ]
        ),
      ]
    )
  end
end
