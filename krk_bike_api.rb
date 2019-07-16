require 'httparty'

class KrkBikeAPI
  include HTTParty
  base_uri 'https://krk.molekula.net'

  def initialize(api_key)
    @api_key = api_key
  end

  def debug_output
    false
    # STDOUT
  end

  def default_options
    {debug_output: false,
     headers: {'User-Agent' => 'Krk%20Bike/12 CFNetwork/978.0.7 Darwin/18.6.0',
               'Content-Type' => 'application/json',
               'Language' => 'en',
               'API-Key' => @api_key}}
  end

  def tracks
    handle_response self.class.get('/api/v1/tracks', default_options)
  end

  def handle_response(response)
    response.parsed_response
  end
end

