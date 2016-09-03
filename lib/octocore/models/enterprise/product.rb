require 'mongo_mapper'
require 'octocore/record'

module Octo
  class Product
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :_id, Integer

    key :price, Float
    key :name, String
    key :routeurl, String

    key :categories, Array
    key :tags, Array

    timestamps!
  end
end
