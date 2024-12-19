module Azure
  module Armrest
    # Base class for managing templates and deployments
    class TemplateDeploymentService < ResourceGroupBasedService

      def initialize(configuration, options = {})
        super(configuration, 'deployments', 'Microsoft.Resources', options)
      end

      # Get names of all deployments in a resource group
      def list_names(resource_group = configuration.resource_group)
        list(resource_group).map(&:name)
      end

      # Get all deployments for the current subscription
      def list_all(filter = {})
        list_in_all_groups(filter)
      end

      # Get all operations of a deployment in a resource group
      def list_deployment_operations(deploy_name, resource_group = configuration.resource_group)
        validate_resource_group(resource_group)
        validate_resource(deploy_name)

        url = build_url(resource_group, deploy_name, 'operations')
        response = rest_get(url)
        JSON.parse(response)['value'].map { |hash| TemplateDeploymentOperation.new(hash) }
      end

      # Get the operation of a deployment in a resource group
      def get_deployment_operation(op_id, deploy_name, resource_group = configuration.resource_group)
        validate_resource_group(resource_group)
        validate_resource(deploy_name)
        raise ArgumentError, "must specify operation id" unless op_id

        url = build_url(resource_group, deploy_name, 'operations', op_id)
        response = rest_get(url)
        TemplateDeploymentOperation.new(response)
      end

      # Returns the raw json template for the given deployment as a string.
      #
      def get_template(deploy_name, resource_group = configuration.resource_group)
        validate_resource_group(resource_group)
        validate_resource(deploy_name)
        url = build_url(resource_group, deploy_name, 'exportTemplate')
        JSON.parse(rest_post(url))['template'].to_json
      end

      # Delete a deployment and all associated resources that were generated by the
      # deployment.
      #
      # This is a synchronous call. It waits until all deletions complete
      def delete_associated_resources(deploy_name, resource_group = configuration.resource_group)
        operations = list_deployment_operations(deploy_name, resource_group)
        resource_ids = operations.collect do |op|
          if op.properties.provisioning_operation =~ /^create$/i
            op.properties.target_resource.id
          end
        end.compact
        resource_ids << build_id_string(resource_group, deploy_name)

        delete_resources(resource_ids, resource_ids.size)
      end

      # Returns whether or not the given deployment exists.
      #
      def exists?(deploy_name, resource_group = configuration.resource_group)
        url = build_url(resource_group, deploy_name)
        rest_head(url) and true
      rescue Azure::Armrest::NotFoundException
        false
      end

      private

      # Don't transform templates or parameters for deployments.
      #
      def transform_create_options(hash)
        properties = hash['properties'] || hash[:properties]
        return super(hash) unless properties

        ignored = properties.extract!(:template, 'template', :parameters, 'parameters')
        hash = super(hash)
        (hash['properties'] || hash[:properties]).merge!(ignored)

        hash
      end

      def delete_resources(ids, retry_cnt)
        if retry_cnt == 0
          ids.each { |id| log("error", "Failed to delete #{id}") }
          return
        end

        remaining_ids = ids.collect { |id| delete_resource(id) }.compact
        delete_resources(remaining_ids, retry_cnt - 1) unless remaining_ids.empty?
      end

      def delete_resource(id_string)
        log("Deleting #{id_string}")

        wait(delete_by_id(id_string), 0)

        log("Deleted #{id_string}")
        nil
      rescue Azure::Armrest::BadRequestException => err
        log("debug", err.to_s)
        log("Resource #{id_string} cannot be deleted because of BadRequestException. Will try again.")
        id_string
      rescue Azure::Armrest::PreconditionFailedException, Azure::Armrest::ConflictException => err
        log("debug", err.to_s)
        log("Resource #{id_string} cannot be deleted because it is used by others. Will try again.")
        id_string
      rescue Azure::Armrest::ResourceNotFoundException => err
        log("debug", err.to_s)
        nil
      end
    end
  end
end