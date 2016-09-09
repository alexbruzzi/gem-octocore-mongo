require 'mongo_mapper'

module Octo
  class PushToken
    include MongoMapper::Document

    belongs_to :user, class_name: 'Octo::User'

    key :push_type, Integer
    key :pushtoken, String

    timestamps!
  end
end

