require 'mongo_mapper'

module Octo
  class UserBrowserDetails
    include MongoMapper::Document

    belongs_to :user, class_name: 'Octo::User'

    key :cookieid, String
    key :name, String
    key :platform, String
    key :manufacturer, String

    timestamps!
  end
end