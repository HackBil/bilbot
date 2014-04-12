require 'twitbot'

# Requires all files within the support folder
Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

class NullObject
  def method_missing(*args, &block)
    nil
  end
end
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.before :each do
    stub_const('ENV', {
      'CONSUMER_KEY'    => 'foo',
      'CONSUMER_SECRET' => 'bar',
      'ACCESS_TOKEN'    => 'fiz',
      'ACCESS_SECRET'   => 'fuz'
    })
  end
end
