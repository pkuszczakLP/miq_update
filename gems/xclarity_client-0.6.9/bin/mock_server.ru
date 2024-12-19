require 'xclarity_client'
require 'apib/mock_server'

blueprints = ""
base_url = "http://localhost:9292"
Dir.glob('docs/apib/*.apib') do |blueprint|
  blueprints << File.open(blueprint).read
end

app = Apib::MockServer.new(base_url, blueprints)
run app
