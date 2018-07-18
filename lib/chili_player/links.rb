require 'chili_player'
require 'chili_player/init'
require 'rest-client'

# require 'chili_player/links'
# lib/chili_player/init.rb
module ChiliPlayer
  # init access class
  module Links
    def all_videos
      RestClient.get(links_url, header_request)
    end

    def get_video(video_id)
      RestClient.get(links_url + video_id.to_s, header_request)
    end

    def upload(name, video)
      RestClient.post(links_url, params(name, video), header_request)
    end

    def delete(video_id)
      RestClient.delete(links_url + video_id.to_s, header_request)
    end

    private

    def params(name, video)
      {
        video: {
          name: name,
          data: File.new(video, 'rb')
        }
      }
    end
  end
end
