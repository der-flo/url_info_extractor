require 'spec_helper'

describe UrlInfoExtractor::Favicon do
  use_vcr_cassette
  it "returns favicon of rubygems.org" do
    infos = UrlInfoExtractor.new('http://rubygems.org')
    infos.favicon_url.should == 'http://rubygems.org/favicon.ico'
  end
  it 'returns the favicon of der-flo.org' do
    infos = UrlInfoExtractor.new('http://der-flo.org')
    infos.favicon_url.should == 'http://der-flo.org/favicon.ico'
  end

  it 'handles pages without an specified favicon' do
    infos = UrlInfoExtractor.new('https://github.com')
    infos.favicon_url.should == 'https://github.com/favicon.ico'
  end

  context 'with non-existing favicon' do
    use_vcr_cassette 'favicon does not exist', record: :none

    it 'checks whether the icon really exists' do
      infos = UrlInfoExtractor.new('http://www.favicon-missing.com/')
      infos.favicon_exists?.should be_false
    end
  end

  context 'with <base> sample' do
    use_vcr_cassette 'with base sample', record: :none
    it 'handles pages with a base specification correct' do
      infos = UrlInfoExtractor.new('http://www.with-base.com/')
      infos.favicon_url.should == 'http://www2.with-base.com/icon.ico'
    end
  end
end

