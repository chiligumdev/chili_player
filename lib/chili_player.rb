require "chili_player/version"

module ChiliPlayer
  class << self
    def demodulize_class(class_name)
      return nil unless class_name
      class_name.to_s.split('::').last.downcase
    end
  end
end
