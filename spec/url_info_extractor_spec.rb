require 'spec_helper'

describe UrlInfoExtractor do
  use_vcr_cassette
  it 'extracts the title from rubygems.org' do
    infos = UrlInfoExtractor.new('http://rubygems.org')
    infos.title.should =~ /rubygems/i
  end
  it 'extracts the title from rubyonrails.org' do
    infos = UrlInfoExtractor.new('http://rubyonrails.org')
    infos.title.should == 'Ruby on Rails'
  end
  it 'recognizes HTTPS url' do
    infos = UrlInfoExtractor.new('https://github.com/')
    infos.title.should == 'GitHub - Social Coding'
  end
  it 'verifies MIME type' do
    infos = UrlInfoExtractor.new('http://rubyonrails.org/images/rails.png')
    infos.title.should be_nil
  end
  it 'support only the HTTP and HTTPS protocol' do
    infos = UrlInfoExtractor.new('ftp://test.com')
    infos.scheme_supported?.should_not be
    expect do
      infos.title
    end.to raise_error(UrlInfoExtractor::SchemeNotSupported)
  end
  it 'extracts the description out of the page' do
    infos = UrlInfoExtractor.new('https://github.com/der-flo/dotfiles')
    infos.description.should == 'dotfiles - My config files'
  end
end

