module Api
  module Subcollections
    module RequestTasks
      def request_tasks_query_resource(object)
        klass = collection_class(:request_tasks)
        object ? klass.where(:miq_request_id => object.id) : {}
      end

      def request_tasks_edit_resource(_object, type, id = nil, data = {})
        raise BadRequestError, "Must specify an id for editing a #{type} resource" unless id
        request_task = resource_search(id, type, collection_class(:request_tasks))
        if data.key?("options")
          updated_options = request_task.options.merge(Hash(data.fetch("options")).deep_symbolize_keys)
          request_task.update!(:options => updated_options)
        end
        request_task
      end

      def request_tasks_cancel_resource(_object, type, id = nil, _data = {})
        resource_search(id, type, collection_class(:request_tasks)).cancel
        action_result(true, "RequestTask #{id} canceled")
      rescue => err
        action_result(false, err.to_s)
      end
    end
  end
end
