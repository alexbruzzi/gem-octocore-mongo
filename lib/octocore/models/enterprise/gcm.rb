require 'mongo_mapper'

module Octo

  # Storage for Notifications
  class GcmNotification
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :gcmid, String
    key :userid, Integer

    key :score, Float
    key :ack, Boolean
    key :sent_at, Time
    key :recieved_at, Time

  end
end

