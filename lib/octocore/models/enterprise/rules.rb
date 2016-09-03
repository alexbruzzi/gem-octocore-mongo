require 'mongo_mapper'
require 'octocore/record'

module Octo
  class Rules
    include MongoMapper::Document
    include Octo::Record

    # Types of conversions
    DAILY               = 0
    WEEKLY              = 1
    WEEKENDS            = 2
    ALTERNATE           = 3

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :name_slug, String       # Name slug as rule
    key :active, Boolean       # Active or Not

    key :name, String         # Name of the rule
    key :segment, String      # slug name of segment
    key :template_cat, String
    key :duration, Integer     # Daily, weekly, weekends ,alternate days
    key :start_time, Time
    key :end_time, Time

    timestamps!

    class << self

      # Fetches the types of durations
      # @return [Hash] The name and its duration value
      def duration_types
        {
          Octo::Rules::DAILY => 'Daily',
          Octo::Rules::WEEKLY => 'Weekly',
          Octo::Rules::WEEKENDS => 'Weekends',
          Octo::Rules::ALTERNATE => 'Alternate Days'
        }
      end
    end

  end
end

