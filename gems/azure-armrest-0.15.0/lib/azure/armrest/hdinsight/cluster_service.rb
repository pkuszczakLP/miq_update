module Azure
  module Armrest
    module HDInsight
      class ClusterService < ResourceGroupBasedService
        def initialize(armrest_configuration, options = {})
          super(armrest_configuration, 'clusters', 'Microsoft.HDInsight', options)
        end
      end
    end
  end
end
