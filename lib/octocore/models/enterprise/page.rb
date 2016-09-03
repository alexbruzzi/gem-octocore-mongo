require 'mongo_mapper'

module Octo
  class Page
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :routeurl, String

    many :categories, String
    many :tags, String
  end
end

