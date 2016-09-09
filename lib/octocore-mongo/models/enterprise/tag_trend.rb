require 'mongo_mapper'
require 'octocore-mongo/trends'

module Octo

  # Class for storing trending tag
  class TagTrend
    include MongoMapper::Document
    extend Octo::Trends

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    trendable

    trend_for 'Octo::TagHit'
    trend_class 'Octo::Tag'
  end
end

