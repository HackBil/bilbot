require 'bilbot'
require 'active_support'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'

ENV['RACK_ENV'] = 'test'

# Requires all files within the support folder
Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include SinatraSpec
  config.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    options = example.metadata.slice(:record, :match_requests_on).except(:example_group)
    VCR.use_cassette(name, options) { example.call }
  end
end
