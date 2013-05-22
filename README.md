# Tangerine

Tangerine is a gem that uses ActiveResource to wrap the Ooyala API. Currently in its infancy, so YMMV.

## Installation

  gem install tangerine

[Tangerine on RubyGems](http://rubygems.org/gems/tangerine)

## Usage

The following is only a proposed usage -- most of this is not yet implemented since the gem is still in development:

### Authentication

You can find your Partner and Secret codes under the Developers area of the Backlot Account tab.

	Tangerine::Backlot::API.authenticate!({
		:api_key => 'API_KEY',
		:secret => 'SECRET_KEY'
	})

### Querying Assets

You can access the `/v2/assets` endpoint, supply your own params and have a JSON hash returned:

	Tangerine.query({
		'limit' => 16,
		'where' => "asset_type='video' AND created_at>'2013-05-20T10:30:09-06:00'"
	})

	
Or, ask for specific asset types and have Tangerine domain models returned.

	Tangerine::Video.all
	[#<Tangerine::Video:0x007f999e0e2f38, ...]

	Tangerine::Channel.all
	[#<Tangerine::ChannelSet:0x007f99999f94f0, ...]

	Tangerine::ChannelSet.all
	[#<Tangerine::Channel:0x007f99999f94f0, ...]
	

## Contribute

The gem has an .rvmrc file, and is currently associated with ree 1.8.7 with its own [RVM](http://rvm.beginrescueend.com/) gemset.

If you don't have 'rvm_install_on_use_flag' turned on in your system/user .rvmrc file, just add the proper ree and gemset when prompted after cd'ing into the project.

[GitHub Repository](http://github.com/factorylabs/tangerine/tree/master)

## Copyright

Copyright (c) 2011 Anthony Navarre. Released under the MIT license. See LICENSE.txt for
further details.

