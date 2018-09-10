# test/test_links.rb
require_relative 'test_helper'
require 'minitest/autorun'
require 'json'

class TestVideos < Minitest::Test
  def setup
    @valid_client = ChiliPlayer::Init.new(token: ENV['VALID_TOKEN'])
    valid_delete = @valid_client.upload('delete-test', 'test.mp4')
    @id_v_delete = valid_delete['id']
    @invalid_client = ChiliPlayer::Init.new(token: 'hsudhadias')
  end

  def test_valid_all_videos
    request = @valid_client.all_videos
    assert_equal request.nil?, false
  end

  def test_invalid_all_videos
    assert_raises RestClient::Unauthorized do
      @invalid_client.all_videos
    end
  end

  def test_valid_get_video_and_update
    request = @valid_client.get_video(166)
    assert_equal request.nil?, false
    request_update = @valid_client.update(166, name: 'Update test')
    assert_equal request_update.nil?, false
  end

  def test_invalid_get_video
    assert_raises RestClient::Unauthorized do
      @invalid_client.get_video(166)
    end
  end

  def test_valid_upload
    request = @valid_client.upload('valid_test', 'test.mp4')
    assert_equal request.nil?, false
  end

  def test_invalid_upload
    assert_raises RestClient::Unauthorized do
      @invalid_client.upload('invalid_test', 'test.mp4')
    end
  end

  def test_valid_delete
    request = @valid_client.delete(@id_v_delete)
    assert_equal request, 'msg' => 'deleted'
  end

  def test_invalid_delete
    assert_raises RestClient::Unauthorized do
      @invalid_client.delete(166)
    end
  end
end
