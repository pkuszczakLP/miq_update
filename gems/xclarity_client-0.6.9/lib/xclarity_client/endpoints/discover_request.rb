module XClarityClient
  class DiscoverRequest < Endpoints::XclarityEndpoint
    BASE_URI = '/discoverRequest'.freeze
    LIST_NAME = 'deviceList'.freeze

    attr_accessor :result, :rackswitchList, :serverList, :xhmcList, :progress, :chassisList, :cmmDisplayName, :cmms, :displayName, :fruNumber, :hostname, :ipAddresses, :machineType, :managementPorts, :model, :name, :password, :recoveryPassword, :serialNumber, :status, :type, :username, :uuid, :enablePassword, :firmware, :os, :subType
  end
end
