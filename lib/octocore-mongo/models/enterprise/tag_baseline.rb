require 'mongo_mapper'

require 'octocore-mongo/baseline'
require 'octocore-mongo/schedeuleable'

module Octo
  class TagBaseline
    include MongoMapper::Document
    extend Octo::Baseline
    extend Octo::Scheduleable

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    baselineable

    # Specify the type of counter
    baseline_for 'Octo::TagHit'
  end
end
