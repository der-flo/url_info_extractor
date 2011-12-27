require 'url_info_extractor'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

