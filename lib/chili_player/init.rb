require 'chili_player'
require 'chili_player/version'
require 'chili_player/videos'
require 'rest-client'

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

    def links_url
      ChiliPlayer::LINKS_URL
    end
  end
end
