require 'mongo_mapper'

require 'octocore/counter'
require 'octocore/trendable'
require 'octocore/schedeuleable'

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
