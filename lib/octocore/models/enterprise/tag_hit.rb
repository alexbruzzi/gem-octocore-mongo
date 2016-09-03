require 'mongo_mapper'

require 'octocore/counter'
require 'octocore/trendable'
require 'octocore/schedeuleable'

module Octo

  class TagHit
    include MongoMapper::Document
    extend Octo::Counter
    extend Octo::Trendable
    extend Octo::Scheduleable

    COUNTERS = 20

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    countables
    trendables

    baseline 'Octo::TagBaseline'
    trends_class 'Octo::TagTrend'

  end
end
