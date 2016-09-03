require 'mongo_mapper'

module Octo
  class User
    include MongoMapper::Document
    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :_id, Integer

    timestamps!

    has_many :user_location_histories
  end
end

