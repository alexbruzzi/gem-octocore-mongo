require 'mongo_mapper'
require 'octocore/record'

module Octo

  class Plan

    include MongoMapper::Document
    include Octo::Record

    key :_id, Integer
    key :active, Boolean

    key :name, String
  end
end

