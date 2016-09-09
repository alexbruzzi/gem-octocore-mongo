require 'mongo_mapper'
require 'octocore-mongo/record'

module Octo
  class Tag
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :tag_text, String
    timestamps!
  end
end
