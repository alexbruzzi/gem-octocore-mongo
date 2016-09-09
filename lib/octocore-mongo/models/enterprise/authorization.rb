require 'mongo_mapper'
require 'securerandom'
require 'octocore-mongo/helpers/kong_helper'

module Octo
  class Authorization
    include MongoMapper::Document
    include Octo::Helpers::KongHelper

    key :username, String

    key :enterprise_id, String
    key :email, String
    key :apikey, String
    key :session_token, String
    key :custom_id, String
    key :password, String
    key :admin, Boolean

    before_create :check_api_key, :generate_password
    after_create :kong_requests

    after_destroy :kong_delete

    timestamps!

    # Check or Generate client apikey
    def check_api_key
      if(self.apikey.nil?)
        self.apikey = SecureRandom.hex
      end
    end

    # Check or Generate client password
    def generate_password
      if(self.password.nil?)
        self.password = Digest::SHA1.hexdigest(self.username + self.enterprise_id)
      else
        self.password = Digest::SHA1.hexdigest(self.password + self.enterprise_id)
      end
    end

    # Perform Kong Operations after creating client
    def kong_requests
      kong_config = Octo.get_config :kong
      if kong_config[:enabled]
        url = '/consumers/'
        payload = {
          username: self.username,
          custom_id: self.enterprise_id
        }

        process_kong_request(url, :PUT, payload)
        create_keyauth( self.username, self.apikey)
      end
    end

    # Delete Kong Records
    def kong_delete
      kong_config = Octo.get_config :kong
      if kong_config[:enabled]
        delete_consumer(self.username)
      end
    end

  end
end
