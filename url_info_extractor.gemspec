# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "url_info_extractor/version"

Gem::Specification.new do |s|
  s.name        = "url_info_extractor"
  s.version     = UrlInfoExtractor::VERSION
  s.authors     = ["Florian Dütsch"]
  s.email       = ["mail@florian-duetsch.de"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "url_info_extractor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency 'rb-fsevent' if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'growl' if RUBY_PLATFORM =~ /darwin/i
  s.add_development_dependency 'vcr', '2.0.0.rc1'
  s.add_development_dependency 'webmock'

  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency 'nokogiri' # TODO: Version?
  s.add_runtime_dependency 'activesupport', '>= 3'
end

