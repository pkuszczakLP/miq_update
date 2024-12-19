module Api
  class ZonesController < BaseController
    include Subcollections::Settings

    INVALID_ZONES_ATTRS = ID_ATTRS + %w[created_on updated_on].freeze

    # Edit an existing zone. Certain fields are meant for internal use only
    # and may not be edited. Attempting to edit one of the forbidden fields
    # will result in a bad request error.
    #
    def edit_resource(type, id, data)
      bad_attrs = data_includes_invalid_attrs(data)

      if bad_attrs.present?
        msg = "Attribute(s) '#{bad_attrs}' should not be specified for updating a zone resource"
        raise BadRequestError, msg
      end

      super
    end

    private

    # Check to see if any of the data attributes contain an invalid field.
    # Returns a list of invalid fields as a comma separated string that you
    # can use for error messages, or nil if the data argument is blank.
    #
    def data_includes_invalid_attrs(data)
      return nil unless data

      data.keys.select { |key| INVALID_ZONES_ATTRS.include?(key) }.compact.join(", ")
    end

    # Since there is a `settings` attribute on Zone, and a subcollection for
    # zones called `settings`, allow "setting" of the `:settings` column, and
    # don't allow setting the "settings" subcollection data on this particular
    # resource.
    #
    def extract_subcollection_data!(subcollections, data)
      subcollection_keys = subcollections.reject { |subc| subc.to_s == "settings" }

      super(subcollection_keys, data)
    end
  end
end
