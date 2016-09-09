require 'mongo_mapper'

module Octo
  class PageView
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :userid,     Integer
    key :created_at, Time, order: :desc

    key :routeurl, String
  end
end
