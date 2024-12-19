module ManageIQ
  module API
    class Client
      class ActionResult
        attr_reader :attributes

        def initialize(action_hash)
          raise "Not a valid Action Result specified" unless self.class.an_action_result?(action_hash)
          @attributes = action_hash.dup
        end

        def self.an_action_result?(hash)
          hash && hash.key?("success") && hash.key?("message")
        end

        def succeeded?
          success
        end

        def failed?
          !success
        end

        def method_missing(sym, *args, &block)
          attributes && attributes.key?(sym.to_s) ? attributes[sym.to_s] : super(sym, *args, &block)
        end

        def respond_to_missing?(sym, *args, &block)
          attributes && attributes.key?(sym.to_s) || super(sym, *args, &block)
        end
      end
    end
  end
end
