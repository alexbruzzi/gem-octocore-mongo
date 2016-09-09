require 'mongo_mapper'
require 'octocore-mongo/record'

module Octo

  # Choices for dimensions
  class DimensionChoice

    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :dimension, Integer
    key :choice, String

    timestamps!

  end
end

