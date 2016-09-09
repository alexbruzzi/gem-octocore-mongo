require 'mongo_mapper'

require 'octocore-mongo/counter'
require 'octocore-mongo/trendable'
require 'octocore-mongo/schedeuleable'

module Octo
  class ApiHit
    include MongoMapper::Document
    extend Octo::Counter
    extend Octo::Scheduleable

    COUNTERS = 30

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    countables

  end
end
