# require "go_usa_gov/version.rb"
require 'net/http'
require 'json'

class GoUsaGov
	URL = "http://go.usa.gov/api"
	attr_accessor :login, :api_key
	
	def initialize(login, api_key)
		@login = login
		@api_key = api_key
	end

	def shorten(long_url, format='json')
		uri = URI("https://go.usa.gov/api/shorten.#{format}")
    params = {
      :login => @login,
      :apiKey => @api_key,
      :longUrl => long_url,
    }

    result = call_url(uri, params)

    if result['data']
      short_url = result['data']['entry'][0]['short_url']
    end

    unless short_url.blank?
      return ({:original => long_url, :short_url => short_url})
    end

    return result
 	end

 	def expand(short_url, format = 'json')
 		uri = URI("https://go.usa.gov/api/expand.#{format}")
    params = {
      :login => @login,
      :apiKey => @api_key,
      :shortUrl => short_url,
    }

    result = call_url(uri, params)

    if result['data']
      long_url = result['data']['entry'][0]['long_url']
    end

    unless long_url.blank?
      return ({:original => short_url, :long_url => long_url})
    end

    return result
 	end

 	def stats(short_url, format = 'json')
 		uri = URI("https://go.usa.gov/api/clicks.#{format}")
    params = {
      :login => @login,
      :apiKey => @api_key,
      :shortUrl => short_url,
    }

    result = call_url(uri, params)

    if result['data']
      user_clicks = result['data']['entry'][0]['user_clicks']
    end

    unless user_clicks.blank?
      return ({:original => short_url, :user_clicks => user_clicks})
    end

    return result
 	end

 	def export(format = 'json')
 		uri = URI("https://go.usa.gov/api/export.#{format}")
    params = {
      :login => @login,
      :apiKey => @api_key,
    }

    result = call_url(uri, params)

    if result['data']
      return result['data']
    end

    return result
 	end

  private
  def call_url(uri, params)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)['response']
  end
end
