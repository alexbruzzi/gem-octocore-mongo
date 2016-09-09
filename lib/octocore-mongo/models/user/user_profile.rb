require 'mongo_mapper'

module Octo
  class UserProfileDetails
    include MongoMapper::Document

    belongs_to :user, class_name: 'Octo::User'

    key :email, String
    key :username, String
    key :dob, String
    key :gender, String
    key :alternate_email, String
    key :mobile, String
    key :extras, String

    timestamps!
  end
end

