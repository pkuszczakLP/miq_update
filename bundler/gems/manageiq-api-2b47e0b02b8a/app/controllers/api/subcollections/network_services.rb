module Api
  module Subcollections
    module NetworkServices
      def network_services_query_resource(object)
        object.try(:network_services) || []
      end
    end
  end
end
