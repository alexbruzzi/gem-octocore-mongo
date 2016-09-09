require 'mongo_mapper'

module Octo
  class Template
    include MongoMapper::Document

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    key :category_type, String

    key :template_text, String
    key :active, Boolean

    timestamps!

  end
end

