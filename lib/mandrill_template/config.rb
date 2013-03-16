require 'singleton'

module MandrillTemplate
  class Config
    include Singleton
    attr_accessor :api_key
  end
end
