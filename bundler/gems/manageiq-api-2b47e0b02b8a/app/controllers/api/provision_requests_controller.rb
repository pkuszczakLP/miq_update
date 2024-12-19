module Api
  class ProvisionRequestsController < BaseController
    include Api::Mixins::ResourceCancel
    include Api::Mixins::ResourceApproveDeny
    include Subcollections::RequestTasks

    def create_resource(type, _id, data)
      assert_id_not_specified(data, type)

      version_str       = data["version"] || "1.1"
      template_fields   = hash_fetch(data, "template_fields")
      vm_fields         = hash_fetch(data, "vm_fields")
      requester         = hash_fetch(data, "requester")
      tags              = hash_fetch(data, "tags")
      additional_values = hash_fetch(data, "additional_values")
      ems_custom_attrs  = hash_fetch(data, "ems_custom_attributes")
      miq_custom_attrs  = hash_fetch(data, "miq_custom_attributes")

      MiqProvisionVirtWorkflow.from_ws(version_str, User.current_user, template_fields, vm_fields, requester, tags,
                                       additional_values, ems_custom_attrs, miq_custom_attrs)
    end

    def edit_resource(type, id, data)
      req = resource_search(id, type)
      RequestEditor.edit(req, data)
      req
    end

    def find_provision_requests(id)
      klass = collection_class(:requests)
      return klass.find(id) if User.current_user.miq_user_role.request_admin_user?
      klass.find_by!(:requester => User.current_user, :id => id)
    end

    def provision_requests_search_conditions
      return {} if User.current_user.miq_user_role.request_admin_user?
      {:requester => User.current_user}
    end
  end
end
