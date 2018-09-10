require 'chili_player'
require 'chili_player/version'
require 'chili_player/videos'
require 'rest-client'
require 'json'

# lib/chili_player/init.rb
module ChiliPlayer
  # init access class
  class Init
    include RestClient
    include ChiliPlayer::Videos

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
end
