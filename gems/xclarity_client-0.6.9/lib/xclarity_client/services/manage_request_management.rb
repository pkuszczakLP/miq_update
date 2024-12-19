require 'json'

module XClarityClient
  # manage request management class
  class ManageRequestManagement < Services::XClarityService
    manages_endpoint ManageRequest

    def manage_discovered_devices(manage_request)
      @connection.do_post(ManageRequest::BASE_URI,
                          JSON.generate([manage_request]))
    end

    def populate_manage_req_with_security_descriptor(manage_request, val)
      security_descriptor = {}
      val = val['securityDescriptor']
      security_descriptor[:managedAuthEnabled] = val['managedAuthSupported']
      security_descriptor[:managedAuthSupported] = val['managedAuthSupported']
      res = security_descriptor[:managedAuthEnabled]
      security_descriptor[:storedCredentials] = val['storedCredentials'] if res
      manage_request[:securityDescriptor] = security_descriptor
    end

    def parse_manage_request(manage_request, val)
      return false unless val.kind_of?(Array) && !val.empty?
      manage_request[:managementPorts] = val[0]['managementPorts']
      manage_request[:type] = val[0]['type']
      manage_request[:uuid] = val[0]['uuid']
      discovery_ip_addr = val[0]['ipAddresses'][0]
      manage_request[:ipAddresses] = [discovery_ip_addr]
      manage_request[:os] = val[0]['os'] if val[0]['type'] == 'Rackswitch'
      populate_manage_req_with_security_descriptor(manage_request, val[0])
    end

    def populate_manage_request_with_discovery_res(discovery_result,
                                                   manage_request)
      discovery_result.map do |req|
        req.instance_variables.each do |attr|
          val = req.instance_variable_get(attr)
          parse_manage_request(manage_request, val)
        end
      end
    end

    def update_manage_request(manage_request, force, discovery_result)
      populate_manage_request_with_discovery_res(discovery_result,
                                                 manage_request)
      manage_request[:forceManage] = true if force.casecmp('true')
    end

    def fetch_manage_request(job_id)
      response = @connection.do_get(ManageRequest::BASE_URI + '/jobs/' + job_id)
      return [] unless response.success?
      body = JSON.parse(response.body)
      body = { ManageRequest::LIST_NAME => body } if body.kind_of?(Array)
      mrql = ManageRequest::LIST_NAME
      body = { ManageRequest::LIST_NAME => [body] } unless body.key?(mrql)
      body[ManageRequest::LIST_NAME].map do |resource_params|
        ManageRequest.new(resource_params)
      end
    end
  end
end
