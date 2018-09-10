require 'chili_player'
require 'chili_player/init'
require 'rest-client'

# lib/chili_player/videos.rb
module ChiliPlayer
  # videos module
  module Videos
    def videos
      response = RestClient.get(endpoint_url, header_request)
      JSON.parse response
    end

    def video(video_id)
      response = RestClient.get(endpoint_url + video_id.to_s, header_request)
      JSON.parse response
    end

    def upload(name, video)
      response = RestClient.post(endpoint_url,
                                 params(name, video), header_request)
      JSON.parse response
    end

    def delete(video_id)
      response = RestClient.delete(endpoint_url + video_id.to_s, header_request)
      JSON.parse response
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
