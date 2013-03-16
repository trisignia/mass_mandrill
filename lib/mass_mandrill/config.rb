require 'singleton'

module MassMandrill
  class Config
    include Singleton
    attr_accessor :api_key
  end
end
