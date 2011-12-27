# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_info_extractor/version"

Gem::Specification.new do |s|
  s.name        = "url_info_extractor"
  s.version     = UrlInfoExtractor::VERSION
  s.authors     = ["Florian Dütsch"]
  s.email       = ["mail@florian-duetsch.de"]
  s.homepage    = "https://github.com/der-flo/url_info_extractor"
  s.summary     = %q{Extract metadata out of a URL}
  s.description = %q{Extract title, meta-description and favicon out of a URL}

  s.rubyforge_project = "url_info_extractor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'vcr', '2.0.0.rc1'
  s.add_development_dependency 'webmock'
  if RUBY_PLATFORM =~ /darwin/i
    s.add_development_dependency 'rb-fsevent'
    s.add_development_dependency 'growl'
  end

  s.add_runtime_dependency 'nokogiri', '~> 1.5'
  s.add_runtime_dependency 'activesupport', '>= 3'
end

