require 'mongo_mapper'
require 'octocore/record'

module Octo

  # Stores the data for funnels
  class FunnelData
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :funnel_slug, String

    key :ts, Time
    many :value, Float

  end
end

