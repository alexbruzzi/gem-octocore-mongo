require 'mongo_mapper'

# Model for Subscribe to us (in the footer), on the microsite
module Octo

  class Subscriber
    include MongoMapper::Document

    key :created_at, Time
    key :email, String

  end
end
