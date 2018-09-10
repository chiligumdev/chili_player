require 'chili_player'
require 'chili_player/init'
require 'rest-client'

# lib/chili_player/videos.rb
module ChiliPlayer
  # videos module
  module Videos
    def all_videos
      RestClient.get(endpoint_url, header_request)
    end

    def get_video(video_id)
      RestClient.get(endpoint_url + video_id.to_s, header_request)
    end

    def upload(name, video)
      RestClient.post(endpoint_url, params(name, video), header_request)
    end

    def delete(video_id)
      RestClient.delete(endpoint_url + video_id.to_s, header_request)
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
