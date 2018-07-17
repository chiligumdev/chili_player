require 'chili_player'
require 'chili_player/init'
require 'rest-client'

# require 'chili_player/links'
# lib/chili_player/init.rb
module ChiliPlayer
  # init access class
  module Links
    def get_videos
      RestClient.get(links_url, header_request)
    end

    def get_video(video_id)
      RestClient.get(links_url + video_id.to_s, header_request)
    end
  end
end