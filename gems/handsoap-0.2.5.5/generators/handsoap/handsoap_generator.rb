# -*- coding: utf-8 -*-
require "#{File.dirname(__FILE__)}/../../lib/handsoap/parser.rb"
require "#{File.dirname(__FILE__)}/../../lib/handsoap/compiler.rb"

# TODO
# options:
#   soap_actions (true/false)
#   soap_version (1/2/auto)
#   basename
class HandsoapGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    # Wsdl argument is required.
    usage if @args.empty?
    @wsdl_uri = @args.shift
  end

  def banner
		"Generates the scaffold for a Handsoap binding."+
      "\n" + "You still have to fill in most of the meat, but this gives you a head start." +
			"\n" + "Usage: #{$0} #{spec.name} URI" +
      "\n" + "  URI       URI of the WSDL to generate from"
  end

  def manifest
    wsdl = Handsoap::Parser::Wsdl.read(@wsdl_uri)
    protocol = wsdl.preferred_protocol
    file_name = Handsoap::Compiler.service_basename(wsdl)
    record do |m|
      m.directory "app"
      m.directory "app/models"
      m.file_contents "app/models/#{file_name}_service.rb" do |file|
        file.write Handsoap::Compiler.compile_service(wsdl, protocol, :soap_actions)
      end
      m.directory "tests"
      m.directory "tests/integration"
      m.file_contents "tests/integration/#{file_name}_service_test.rb" do |file|
        file.write Handsoap::Compiler.compile_test(wsdl, protocol)
      end
      # TODO
      # Ask user about which endpoints to use ?
      # puts "Detected endpoints:"
      # puts Handsoap::Compiler.compile_endpoints(wsdl, protocol)
    end
  end

end

module Handsoap #:nodoc:
  module Generator #:nodoc:
    module Commands #:nodoc:
      module Create
        def file_contents(relative_destination, &block)
          destination = destination_path(relative_destination)
          temp_file = Tempfile.new("handsoap_generator")
          if RUBY_PLATFORM =~ /win32/
            canonical_path = File.expand_path(source_path("/."))
          else
            canonical_path = `readlink -fn '#{source_path("/.")}'`
          end
          temp_file_relative_path = relative_path(temp_file.path, canonical_path)
          begin
            yield temp_file
            temp_file.close
            return self.file(temp_file_relative_path, relative_destination)
          ensure
            temp_file.unlink
          end
        end

        private

        # Convert the given absolute path into a path
        # relative to the second given absolute path.
        # http://www.justskins.com/forums/file-relative-path-handling-97116.html
        def relative_path(abspath, relative_to)
          path = abspath.split(File::SEPARATOR)
          rel = relative_to.split(File::SEPARATOR)
          while (path.length > 0) && (path.first == rel.first)
            path.shift
            rel.shift
          end
          ('..' + File::SEPARATOR) * rel.length + path.join(File::SEPARATOR)
        end
      end
    end
  end
end

Rails::Generator::Commands::Create.send :include, Handsoap::Generator::Commands::Create
