require 'mongo_mapper'

module Octo
  class ApiTrack
    include MongoMapper::Document

    key :customid, ObjectId
    key :created_at, Time
    key :json_dump, String
    key :type, String

  end
end
