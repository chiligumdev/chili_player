# test/test_init.rb
require_relative 'test_helper'
require 'minitest/autorun'

class TestInit < Minitest::Test
  
  def setup
    @token = 'ausdhuas'
  end

  def test_initialize
    init_class = ChiliPlayer::Init.new(token: @token)
    assert_equal init_class.instance_variable_get(:@token), @token
  end

  def test_url
    assert_equal ChiliPlayer::LINKS_URL, 'http://player.chiligumvideos.com/api/videos/'
  end
end
