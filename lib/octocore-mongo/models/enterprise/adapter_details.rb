require 'mongo_mapper'
require 'octocore-mongo/record'

module Octo
	# Store adapter details of Enterprise
  class AdapterDetails
    include MongoMapper::Document
    include Octo::Record

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :adapter_id, Integer
    key :enable, Boolean
    
    key :settings, String

  end
end
