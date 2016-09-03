require 'mongo_mapper'
require 'octocore/trends'

module Octo

  # Class for storing trending product
  class ProductTrend
    include MongoMapper::Document
    extend Octo::Trends

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    trendable

    trend_for 'Octo::ProductHit'
    trend_class 'Octo::Product'
  end
end
