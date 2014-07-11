require 'vcr'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.filter_sensitive_data('<Yelp API key>') { ENV['YWS_ID'] }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
