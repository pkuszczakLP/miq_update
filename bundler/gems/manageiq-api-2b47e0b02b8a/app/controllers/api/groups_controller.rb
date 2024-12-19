module Api
  class GroupsController < BaseController
    INVALID_GROUP_ATTRS = %w(id href group_type).freeze

    include Subcollections::CustomButtonEvents
    include Subcollections::Tags

    # NOTE: tenant groups not found/edited. system group (read only) will be found so manually reject
    def groups_search_conditions
      ["group_type != ?", MiqGroup::TENANT_GROUP]
    end

    # NOTE: tenant groups are not found/edited.
    #       system group (read_only? == true) will be found so we need to manually reject in delete/update
    def find_groups(id)
      MiqGroup.non_tenant_groups.find(id)
    end

    def create_resource(_type, _id, data)
      validate_group_data(data)
      parse_set_role(data)
      parse_set_tenant(data)
      parse_set_filters(data)
      group = collection_class(:groups).create(data.to_h)
      if group.invalid?
        raise BadRequestError, "Failed to add a new group - #{group.errors.full_messages.join(', ')}"
      end
      group
    end

    def edit_resource(type, id, data)
      validate_group_data(data)
      parse_set_role(data)
      parse_set_tenant(data)
      group = resource_search(id, type)
      parse_set_filters(data, :entitlement_id => group.entitlement.try(:id))
      raise ForbiddenError, "Cannot edit a read-only group" if group.read_only
      super
    end

    def delete_resource_main_action(type, group, data = {})
      raise ForbiddenError, "Cannot delete a read-only group" if group.read_only?

      super
    end

    private

    def parse_set_role(data)
      role = parse_fetch_role(data.delete("role"))
      data["miq_user_role"] = role if role
    end

    def parse_set_tenant(data)
      tenant = parse_fetch_tenant(data.delete("tenant"))
      data["tenant"] = tenant if tenant
    end

    # HACK: Format attrs to use accepts_nested_attributes_for (Entitlements)
    # Required for backwards compatibility of creating filters via group
    def parse_set_filters(data, entitlement_id: nil)
      filters           = data.delete("filters")
      filter_expression = data.delete("filter_expression")
      filter_expression = filter_expression["exp"] if filter_expression && filter_expression["exp"]
      if filters || filter_expression
        entitlements = {"id" => entitlement_id}
        entitlements["filters"]           = filters.stringify_keys.to_h          if filters
        entitlements["filter_expression"] = MiqExpression.new(filter_expression) if filter_expression
        data["entitlement_attributes"] = entitlements
      end
    end

    def group_data_includes_invalid_attrs(data)
      data.keys.select { |k| INVALID_GROUP_ATTRS.include?(k) }.compact.join(", ") if data
    end

    def validate_group_data(data)
      bad_attrs = group_data_includes_invalid_attrs(data)
      raise BadRequestError, "Invalid attribute(s) #{bad_attrs} specified for a group" if bad_attrs.present?
      raise BadRequestError, "Invalid filters specified" unless Entitlement.valid_filters?(data["filters"])
    end
  end
end
