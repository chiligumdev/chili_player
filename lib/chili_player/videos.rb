require 'chili_player'
require 'chili_player/init'
require 'rest-client'

# lib/chili_player/videos.rb
module ChiliPlayer
  # videos module
  module Videos
    def all_videos
      RestClient.get(links_url, header_request)
    end

    def get_video(video_id)
      RestClient.get(links_url + video_id.to_s, header_request)
    end

    def upload(name, video, options = {})
      RestClient.post(links_url, params(name, video, options), header_request)
    end

    def delete(video_id)
      RestClient.delete(links_url + video_id.to_s, header_request)
    end

    private

    def params(name, video, options)
      data = { video: {} }
      data[:video][:name] = name
      data[:video][:data] = File.new(video, 'rb')
      data[:video].merge!(options)
      data
    end
  end
end
