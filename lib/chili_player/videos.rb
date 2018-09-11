require 'chili_player'
require 'chili_player/init'
require 'rest-client'
require 'json'

# lib/chili_player/videos.rb
module Videos
  def videos
    JSON.parse RestClient.get(endpoint_url, header_request)
  end

  def video(video_id)
    JSON.parse RestClient.get(endpoint_url + video_id.to_s, header_request)
  end

  def upload(name, video, options = {})
    JSON.parse RestClient.post(endpoint_url, params(options, name, video),
                               header_request)
  end

  def update(video_id, options)
    JSON.parse RestClient.patch(endpoint_url + video_id.to_s, params(options),
                                header_request)
  end

  def delete(video_id)
    JSON.parse RestClient.delete(endpoint_url + video_id.to_s, header_request)
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
