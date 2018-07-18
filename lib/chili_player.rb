require 'chili_player/version'
require 'chili_player/init'
require 'chili_player/links'
require 'rest-client'

# lib/chili_player.rb
module ChiliPlayer
  class << self
    def demodulize_class(class_name)
      return nil unless class_name
      class_name.to_s.split('::').last.downcase
    end
  end
end
