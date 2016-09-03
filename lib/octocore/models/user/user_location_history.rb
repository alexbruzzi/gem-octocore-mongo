require 'mongo_mapper'

module Octo
  class UserLocationHistory
    include MongoMapper::Document

    belongs_to :user, class_name: 'Octo::User'

    key :created_at, Time

    key :latitude, Float
    key :longitude, Float
  end
end

