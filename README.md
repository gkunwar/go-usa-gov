# GoUsaGov

A Ruby API for https://gov.usa.gov

https://go.usa.gov/api

## Installation

Add this line to your application's Gemfile:

    gem 'go_usa_gov', :git => "git@github.com:gkunwar/go-usa-gov.git"

And then execute:

    $ bundle


## Usage

Create a GoUsaGov client using your username and api key as follows:

	gov = GoUsaGov.new(username, api_key)

You can then use that client to shorten or expand urls or return more information or statistics as so:

	gov.shorten("http://www.uscis.gov/portal/site/uscis-es")
	gov.expand("https://go.usa.gov/gEdP")
	gov.stats("https://go.usa.gov/gEdP")
	gov.export

## Contributing

1. Fork it ( https://github.com/gkunwar/go_usa_gov/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
