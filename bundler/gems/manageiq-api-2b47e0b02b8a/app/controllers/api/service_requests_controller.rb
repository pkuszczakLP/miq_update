module Api
  class ServiceRequestsController < BaseController
    include Subcollections::RequestTasks
    include Api::Mixins::Pictures
    include Api::Mixins::ResourceCancel
    include Api::Mixins::ResourceApproveDeny

    alias fetch_service_requests_picture fetch_picture

    def edit_resource(type, id, data)
      request = resource_search(id, type)
      RequestEditor.edit(request, data)
      request
    end

    def find_service_requests(id)
      klass = collection_class(:service_requests)
      return klass.find(id) if User.current_user.miq_user_role.request_admin_user?
      klass.find_by!(:requester => User.current_user, :id => id)
    end

    def service_requests_search_conditions
      return {} if User.current_user.miq_user_role.request_admin_user?
      {:requester => User.current_user}
    end

    def get_user(data)
      user_id = data['user_id'] || parse_id(data['user'], :users)
      raise 'Must specify a valid user_id or user' unless user_id
      User.find(user_id)
    end

    def add_approver_resource(type, id, data)
      user = get_user(data)
      miq_approval = MiqApproval.create(:approver => user)
      resource_search(id, type).tap do |service_request|
        service_request.miq_approvals << miq_approval
      end
    rescue => err
      raise BadRequestError, "Cannot add approver - #{err}"
    end

    def remove_approver_resource(type, id, data)
      user = get_user(data)
      resource_search(id, type).tap do |service_request|
        miq_approval = service_request.miq_approvals.find_by(:approver_name => user.name)
        miq_approval.destroy if miq_approval
      end
    rescue => err
      raise BadRequestError, "Cannot remove approver - #{err}"
    end
  end
end
