require 'mongo_mapper'
require 'octocore-mongo/record'

module Octo

  class Ctr

    include MongoMapper::Document
    include Octo::Record

    # Type of Ctr. Reserved for future use
    NEWSFEED = 0

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :ts, Time

    key :value, Array

    class << self

      def data( enterprise_id, ts = Time.now.floor)
        args = {
          enterprise_id: enterprise_id,
          ts: ts
        }
        res = self.where(args)
        if res.count > 0
          res.first
        else
          args.merge!({ value: value_array(15)})
          self.new(args).save!
        end
      end

      def value_array(count)
        arr = []
        res = []
        sum = 0
        count.times do |x|
          temp = rand(10.00..100.00)
          arr.push(temp)
          sum = sum + temp
        end
        count.times do |x|
          res.push((arr[x]/sum)*100)
        end
        res
      end

    end
  end

end
