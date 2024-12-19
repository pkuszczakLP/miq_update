module Api
  class FirmwareRegistriesController < BaseController
    def create_resource(type, _id, data)
      assert_id_not_specified(data, type)
      collection_class(type).create_firmware_registry(data.symbolize_keys)
    end

    def sync_fw_binaries_resource(type, id, _data)
      resource_search(id, type).sync_fw_binaries_queue
      action_result(true, "FirmwareBinary [id: #{id}] synced")
    rescue => err
      action_result(false, err.to_s)
    end
  end
end
