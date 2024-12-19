dialog_field = $evm.object
dialog_field["sort_by"] = "value"
dialog_field["sort_order"] = "ascending"
dialog_field["data_type"] = "string"
dialog_field["required"] = true

selected_ems_id = $evm.root.attributes['dialog_ems']
selected_ems = $evm.vmdb(:ext_management_system).find_by(:id =>selected_ems_id)

templates = selected_ems.physical_server_profile_templates
templates_l = templates.map { |t| {t.id => t.name} }
dialog_field["values"] = Hash[*templates_l.map(&:to_a).flatten]

exit MIQ_OK
