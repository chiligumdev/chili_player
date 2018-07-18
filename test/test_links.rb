# test/test_links.rb
require_relative 'test_helper'
require 'minitest/autorun'
require 'json'

class TestLinks < Minitest::Test
  def setup
    @valid_client = ChiliPlayer::Init.new(token: ENV['VALID_TOKEN'])
    valid_delete = @valid_client.upload('delete-test', 'test.mp4')
    @id_v_delete = JSON.parse(valid_delete.body)['id']
    @invalid_client = ChiliPlayer::Init.new(token: 'hsudhadias')
  end

  def test_valid_get_videos
    request = @valid_client.get_videos
    assert_equal request.code, 200
    assert_equal request.body.include?('error'), false
  end

  def test_invalid_get_videos
    assert_raises RestClient::Unauthorized do
      @invalid_client.get_videos
    end
  end

  def test_valid_get_video
    request = @valid_client.get_video(166)
    assert_equal request.code, 200
    assert_equal request.body.include?('error'), false
  end

  def test_invalid_get_video
    assert_raises RestClient::Unauthorized do
      @invalid_client.get_video(166)
    end
  end

  def test_valid_upload
    request = @valid_client.upload('valid_test', 'test.mp4')

    assert_equal request.code, 200
    assert_equal request.body.include?('error'), false
  end

  def test_invalid_upload
    assert_raises RestClient::Unauthorized do
      @invalid_client.upload('invalid_test', 'test.mp4')
    end
  end

  def test_valid_delete
    request = @valid_client.delete(@id_v_delete)
    assert_equal request.body, '{"msg":"deleted"}'
  end

  def test_invalid_delete
    assert_raises RestClient::Unauthorized do
      @invalid_client.delete(166)
    end
  end
end
