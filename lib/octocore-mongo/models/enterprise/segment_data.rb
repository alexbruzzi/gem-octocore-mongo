require 'mongo_mapper'
require 'octocore-mongo/record'
require 'set'

module Octo

  # The SegmentData class. This class holds data for the segments
  class SegmentData

    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :segment_slug, String  # Using key as segment name's slug

    key :ts, Time    # The timestamp at which data is collected
    key :value, Array       # List of values containing data collected

  end
end

