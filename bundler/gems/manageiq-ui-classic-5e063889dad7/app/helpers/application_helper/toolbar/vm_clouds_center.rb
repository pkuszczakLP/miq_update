class ApplicationHelper::Toolbar::VmCloudsCenter < ApplicationHelper::Toolbar::Basic
  button_group('instance_vmdb', [
    select(
      :instance_vmdb_choice,
      nil,
      N_('Configuration'),
      :enabled => false,
      :onwhen  => "1+",
      :items   => [
        button(
          :instance_refresh,
          'fa fa-refresh fa-lg',
          N_('Refresh relationships and power states for all items related to the selected items'),
          N_('Refresh Relationships and Power States'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Refresh relationships and power states for all items related to the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_scan,
          'fa fa-search fa-lg',
          N_('Perform SmartState Analysis on the selected items'),
          N_('Perform SmartState Analysis'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Perform SmartState Analysis on the selected items?"),
          :enabled      => false,
          :klass        => ApplicationHelper::Button::BasicImage,
          :onwhen       => "1+"),
        button(
          :instance_compare,
          'ff ff-compare-same fa-lg',
          N_('Select two or more items to compare'),
          N_('Compare Selected items'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "2+"),
        separator,
        button(
          :instance_edit,
          'pficon pficon-edit fa-lg',
          N_('Select a single item to edit'),
          N_('Edit Selected item'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1"),
        button(
          :instance_ownership,
          'pficon pficon-user fa-lg',
          N_('Set Ownership for the selected items'),
          N_('Set Ownership'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
        separator,
        button(
          :instance_delete,
          'pficon pficon-delete fa-lg',
          N_('Remove selected items from Inventory'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Warning: The selected items and ALL of their components will be permanently removed!"),
          :enabled      => false,
          :onwhen       => "1+"),
        separator,
        button(
          :instance_resize,
          'pficon pficon-edit fa-lg',
          t = N_('Reconfigure selected Instance'),
          t,
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1")
      ]
    ),
  ])
  button_group('instance_policy', [
    select(
      :instance_policy_choice,
      nil,
      N_('Policy'),
      :enabled => false,
      :onwhen  => "1+",
      :items   => [
        button(
          :instance_protect,
          'pficon pficon-edit fa-lg',
          N_('Manage Policies for the selected items'),
          N_('Manage Policies'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_policy_sim,
          'fa fa-play-circle-o fa-lg',
          N_('View Policy Simulation for the selected items'),
          N_('Policy Simulation'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_tag,
          'pficon pficon-edit fa-lg',
          N_('Edit tags for the selected items'),
          N_('Edit Tags'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_check_compliance,
          'fa fa-search fa-lg',
          N_('Check Compliance of the last known configuration for the selected items'),
          N_('Check Compliance of Last Known Configuration'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Initiate Check Compliance of the last known configuration for the selected items?"),
          :enabled      => true,
          :onwhen       => "1+",
          :klass        => ApplicationHelper::Button::InstanceCheckCompare),
      ]
    ),
  ])
  button_group('instance_lifecycle', [
    select(
      :instance_lifecycle_choice,
      nil,
      N_('Lifecycle'),
      :items => [
        button(
          :instance_miq_request_new,
          'pficon pficon-add-circle-o fa-lg',
          N_('Request to Provision Instances'),
          N_('Provision Instances'),
          :url_parms    => "main_div",
          :send_checked => true,
          :klass        => ApplicationHelper::Button::InstanceMiqRequestNew),
        button(
          :instance_retire,
          'fa fa-clock-o fa-lg',
          N_('Set Retirement Dates for the selected items'),
          N_('Set Retirement Dates'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_retire_now,
          'fa fa-clock-o fa-lg',
          N_('Retire the selected items'),
          N_('Retire selected items'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Retire the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_live_migrate,
          'pficon pficon-migration fa-lg',
          t = N_('Migrate selected Instances'),
          t,
          :url_parms    => 'main_div',
          :send_checked => true,
          :enabled      => false,
          :onwhen       => '1+'),
        button(
          :instance_evacuate,
          'fa fa-reply fa-rotate-90 fa-lg',
          N_('Evacuate selected Instances'),
          :url_parms    => 'main_div',
          :send_checked => true,
          :enabled      => false,
          :onwhen       => '1+')
      ]
    ),
  ])
  button_group('instance_operations', [
    select(
      :instance_power_choice,
      nil,
      N_('Power Operations'),
      N_('Power'),
      :enabled => false,
      :onwhen  => "1+",
      :items   => [
        button(
          :instance_stop,
          nil,
          N_('Stop the selected items'),
          N_('Stop'),
          :icon         => "fa fa-stop fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Stop the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_start,
          nil,
          N_('Start the selected items'),
          N_('Start'),
          :icon         => "fa fa-play fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Start the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_pause,
          nil,
          N_('Pause the selected items'),
          N_('Pause'),
          :icon         => "fa fa-pause fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Pause the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_suspend,
          nil,
          N_('Suspend the selected items'),
          N_('Suspend'),
          :icon         => "fa fa-pause fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Suspend the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_shelve,
          nil,
          N_('Shelve the selected items'),
          N_('Shelve'),
          :icon         => "pficon pficon-pending fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Shelve the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_shelve_offload,
          nil,
          N_('Shelve Offload the selected items'),
          N_('Shelve Offload'),
          :icon         => "pficon pficon-pending fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Shelve Offload the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        separator,
        button(
          :instance_guest_restart,
          nil,
          N_('Soft Reboot the selected items'),
          N_('Soft Reboot'),
          :icon         => "pficon pficon-restart fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Soft Reboot the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_reset,
          nil,
          N_('Hard Reboot the Guest OS on the selected items'),
          N_('Hard Reboot'),
          :icon         => "pficon pficon-restart fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Hard Reboot the Guest OS on the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
        button(
          :instance_terminate,
          nil,
          N_('Delete the selected items'),
          N_('Delete'),
          :icon         => "pficon pficon-delete fa-lg",
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Delete the selected items?"),
          :enabled      => false,
          :onwhen       => "1+"),
      ]
    ),
  ])
end