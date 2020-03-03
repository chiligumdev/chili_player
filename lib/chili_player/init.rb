require 'chili_player'
require 'chili_player/version'
require 'chili_player/videos'
require 'rest-client'
require 'json'

# init access class
class Player
  include RestClient
  include Videos

  def initialize(options = {})
    instance_variable_set('@token', options)
    instance_variable_set('@external_id', options)
  end

  private

  def header_request
    {
      token: @token.to_s,
      'external-id' => @external_id.to_s
    }
  end

  def endpoint_url
    ChiliPlayer::ALLOWED_URLS.include?(@url) ? @url : ChiliPlayer::DEFAULT_URL
  end
end
