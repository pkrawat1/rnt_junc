class Product
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :photos, type: String
  field :owner, type: User
  field :customer, type: User
end
