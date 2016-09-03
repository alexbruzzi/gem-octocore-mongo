require 'mongo_mapper'

module Octo
  class PushKey
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :push_type, Integer
    key :key, String

    timestamps!
  end
end

