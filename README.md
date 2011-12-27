UrlInfoExtractor
================

The library helps you extracting some metadata out of HTML URLs.

[https://github.com/der-flo/url_info_extractor](github.com/der-flo/url_info_extractor)

Usage
-----
    % gem install url_info_extractor

    require 'url_info_extractor'
    infos = UrlInfoExtractor.new('http://rubygems.org')
    puts infos.title
    # RubyGems.org | your community gem host
    puts infos.favicon_url
    # http://rubygems.org/favicon.ico
    puts infos.favicon_exists?
    # true
    puts infos.description
    #

Note that the favicon handling determines the URL by link-rel-icon tag and
base tag. `favicon_exists?` does an HTTP HEAD request to check whether the
icon is available at the determined path.

Fork me!
--------
If you find this library useful but miss some feature, please drop me a note
or - even better - fork the project at GitHub. Along with some specs I'll
accept your pull requests.

Author and license
------------------
* Florian Dütsch (mail AT florian-duetsch.de)
* MIT, see LICENSE file.

