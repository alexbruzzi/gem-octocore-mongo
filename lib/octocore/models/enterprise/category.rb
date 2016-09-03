require 'mongo_mapper'
require 'octocore/record'

module Octo
  class Category
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :cat_text, String
    timestamps!
  end
end
