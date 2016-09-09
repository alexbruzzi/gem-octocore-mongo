require 'mongo_mapper'
require 'octocore-mongo/record'

module Octo
  class ApiEvent
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :eventname, String
  end
end

