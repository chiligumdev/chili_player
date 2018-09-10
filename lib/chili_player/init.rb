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
  end

  private

  def header_request
    { token: @token }
  end

  def endpoint_url
    ChiliPlayer::ENDPOINT_URL
  end
end
