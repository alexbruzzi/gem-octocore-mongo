require 'mongo_mapper'

module Octo
  class User
    include MongoMapper::Document
    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    timestamps!

    many :user_location_histories, class_name: 'Octo::UserLocationHistory'
  end
end

