class Address
  include Mongoid::Document
  field :house,  type: String
  field :street, type: String
  field :city,   type: String
  field :state,  type: String
  field :pin,    type: String

  embedded_in :user
end
