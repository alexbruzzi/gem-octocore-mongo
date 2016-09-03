require 'mongo_mapper'

module Octo
  # A model for tracking the user web flow
  # Used to build a markov model on the basis
  #  of the activity. eg p1 --> p2 will be entered
  #  with weight 1, and increased by +1 every time any
  #  user goes from p1 to p2
  class FunnelTracker
    include MongoMapper::Document

    key :enterprise_id, ObjectId

    key :p1, String
    key :direction, Integer
    key :p2, String
    key :weight, Integer
  end
end