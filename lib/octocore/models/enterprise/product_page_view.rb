require 'mongo_mapper'

module Octo
  class ProductPageView
    include MongoMapper::Document
    belongs_to :enterprise, class_name: 'Octo::Enterprise'
    
    key :userid, Integer
    key :created_at, Time, order: :desc
    
    key :product_id, Integer
  end
end
