require 'spec_helper'

describe UrlInfoExtractor::Favicon do
  use_vcr_cassette record: :new_episodes

  it "returns favicon of rubygems.org" do
    infos = UrlInfoExtractor.new('http://rubygems.org')
    infos.favicon_url.should == 'http://rubygems.org/favicon.ico'
  end
  it 'returns the favicon of der-flo.org' do
    infos = UrlInfoExtractor.new('http://der-flo.org')
    infos.favicon_url.should == 'http://der-flo.org/favicon.ico'
  end

  it 'handles pages with a base specification correct'
  it 'handles pages without an specified favicon'
  it 'checks whether the icon really exists'
end

