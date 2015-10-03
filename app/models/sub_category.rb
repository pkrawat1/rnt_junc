class SubCategory
  include Mongoid::Document
  field :name, type: String

  belongs_to :category
end
