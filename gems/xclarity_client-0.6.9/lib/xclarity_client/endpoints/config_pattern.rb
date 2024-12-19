module XClarityClient
  class ConfigPattern < Endpoints::XclarityEndpoint
    BASE_URI = '/patterns'.freeze
    LIST_NAME = 'items'.freeze

    attr_accessor :identifier, :items, :label, :id, :referencedBy, :userDefined, :formFactor, :inUse, :description, :name, :nodeType, :type,
    :uri, :serverType, :template_type, :server_template, :storageSettings, :bootSettings, :adapterSettings,
    :templates, :sub_templates, :useCount
  end
end

