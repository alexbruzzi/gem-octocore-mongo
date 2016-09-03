require 'mongo_mapper'

module Octo
  class Page
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :routeurl, String

    key :categories, Array
    key :tags, Array
  end
end

