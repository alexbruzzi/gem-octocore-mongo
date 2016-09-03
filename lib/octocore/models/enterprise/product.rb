require 'mongo_mapper'
require 'octocore/record'

module Octo
  class Product
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :id, Integer

    key :price, Float
    key :name, String
    key :routeurl, String

    many :categories, String
    many :tags, String

    timestamps!
  end
end
