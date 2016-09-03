require 'mongo_mapper'
require 'octocore/record'
require 'set'

module Octo

  # The SegmentData class. This class holds data for the segments
  class SegmentData

    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :segment_slug, String  # Using key as segment name's slug

    key :ts, Time    # The timestamp at which data is collected
    many :value, Float       # List of values containing data collected

  end
end

