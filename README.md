# Tangerine

Tangerine is a gem that uses ActiveResource to wrap the Ooyala API. Currently in its infancy, so YMMV.

[ ![Codeship Status for factorylabs/Tangerine](https://www.codeship.io/projects/49dd6d50-af87-0130-b26f-7a97a098c4e6/status?branch=master)](https://www.codeship.io/projects/4026)

## Installation

  gem install tangerine

[Tangerine on RubyGems](http://rubygems.org/gems/tangerine)

## Usage

The following is only a proposed usage -- most of this is not yet implemented since the gem is still in development:

### Authorization with your Ooyala Account

You can find your Partner and Secret codes under the Developers area of the Backlot Account tab.

  OOYALA_CREDENTIALS = {
      :pcode => **<YOUR PCODE HERE>**,
      :signature => **<YOUR SIGNATURE HERE>**
    }
  tangerine_client = Tangerine::Backlot.new(OOYALA_CREDENTIALS)

### Queries

  tangerine_client.query(:status => 'live')

## Contribute

The gem has an .rvmrc file, and is currently associated with ree 1.8.7 with its own [RVM](http://rvm.beginrescueend.com/) gemset.

If you don't have 'rvm_install_on_use_flag' turned on in your system/user .rvmrc file, just add the proper ree and gemset when prompted after cd'ing into the project.

[GitHub Repository](http://github.com/factorylabs/tangerine/tree/master)

## Copyright

Copyright (c) 2011 Anthony Navarre. Released under the MIT license. See LICENSE.txt for
further details.

