require 'mongo_mapper'
require 'octocore-mongo/trends'

module Octo

  # Class for storing trending category
  class CategoryTrend
    include MongoMapper::Document
    extend Octo::Trends

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    trendable

    trend_for 'Octo::CategoryHit'
    trend_class 'Octo::Category'
  end
end

