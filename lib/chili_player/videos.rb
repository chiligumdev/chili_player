require 'chili_player'
require 'chili_player/init'
require 'rest-client'
require 'json'

# lib/chili_player/videos.rb
module ChiliPlayer
  # videos module
  module Videos
    def all_videos
      JSON.parse RestClient.get(links_url, header_request)
    end

    def get_video(video_id)
      JSON.parse RestClient.get(links_url + video_id.to_s, header_request)
    end

    def upload(name, video, options = {})
      JSON.parse RestClient.post(links_url, params(options, name, video),
                                 header_request)
    end

    def update(video_id, options)
      JSON.parse RestClient.patch(links_url + video_id.to_s, params(options),
                                  header_request)
    end

    def delete(video_id)
      JSON.parse RestClient.delete(links_url + video_id.to_s, header_request)
    end

    private

    def params(options, name = nil, video = nil)
      data = { video: {} }
      options.delete(:data)
      data[:video].merge!(options)
      data[:video][:name] = name unless name.nil?
      data[:video][:data] = File.new(video, 'rb') unless video.nil?
      data
    end
  end
end
