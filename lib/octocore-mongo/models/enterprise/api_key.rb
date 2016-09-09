require 'mongo_mapper'

module Octo
  class ApiKey
    include MongoMapper::Document

    key :enterprise_key, String
    key :enterprise_id, ObjectId

  end
end
