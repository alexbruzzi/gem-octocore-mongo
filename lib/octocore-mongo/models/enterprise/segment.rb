require 'mongo_mapper'
require 'octocore-mongo/record'
require 'set'

module Octo

  # The segment class. Responsible for segments
  class Segment
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :name_slug, String       # Name slug as key
    key :active, Boolean       # Active or Not

    key :intelligence, Boolean # If it is Octo's intelligent segment or manual

    key :name, String         # Name of the segment
    key :type, Integer          # Type of segment
    key :event_type, String   # Event Type used for events segmentation

    key :dimensions, Array      # list storing dimensions used
    key :operators, Array       # list storing operators on dimensions
    key :dim_operators, Array   # list storing operators between dimensions
    key :values, Array         # list of values for operations on dimensions

    timestamps!                  # The usual housekeeping thing

    before_create :create_name_slug, :activate

    # Creates name slug
    def create_name_slug
      self.name_slug = self.name.to_slug
    end

    def activate
      self.active = true
    end

    def data(ts = Time.now.floor)
      args = {
        enterprise_id: self.enterprise._id,
        segment_slug: self.name_slug,
        ts: ts
      }
      res = Octo::SegmentData.where(args)
      if res.count > 0
        res.first
      elsif self.enterprise.fakedata?
        # populate a poser data
        val = [rand(1000..10000), rand(0.0..70.0)]
        args.merge!({ value: val })
        Octo::SegmentData.new(args).save!
      end
    end

    def self.find_by_enterprise_and_name(enterprise, name)
      where({enterprise_id: enterprise._id, name_slug: name.to_slug})
    end


  end
end

