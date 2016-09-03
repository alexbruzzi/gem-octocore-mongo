require 'mongo_mapper'

module Octo
  class UserPhoneDetails
    include MongoMapper::Document

    belongs_to :user, class_name: 'Octo::User'

    key :deviceid, String
    key :manufacturer, String
    key :model, String
    key :os, String

    timestamps!
  end
end

