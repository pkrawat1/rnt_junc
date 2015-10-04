class Product
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :mft,  type: Date

  belongs_to  :sub_categories
  belongs_to  :owner, class_name: 'User'
  has_many    :users_products
end
