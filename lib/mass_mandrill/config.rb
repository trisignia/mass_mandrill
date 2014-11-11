require 'singleton'

module MassMandrill
  class Config
    include Singleton
    #api_key is now read automatically from ENV in the official mandrill-api gem
    #attr_accessor :api_key
  end
end
