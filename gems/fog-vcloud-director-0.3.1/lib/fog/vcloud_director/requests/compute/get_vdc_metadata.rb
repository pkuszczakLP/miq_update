module Fog
  module VcloudDirector
    class Compute
      class Real
        # Retrieve metadata associated with a vDC.
        #
        # @param [String] id Object identifier of the vDC.
        # @return [Excon::Response]
        #   * body<~Hash>:
        #
        # @see http://pubs.vmware.com/vcd-51/topic/com.vmware.vcloud.api.reference.doc_51/doc/operations/GET-VdcMetadata.html
        # @since vCloud API version 1.5
        def get_vdc_metadata(id)
          request(
            :expects    => 200,
            :idempotent => true,
            :method     => 'GET',
            :parser     => Fog::ToHashDocument.new,
            :path       => "vdc/#{id}/metadata/"
          )
        end
      end
    end
  end
end
