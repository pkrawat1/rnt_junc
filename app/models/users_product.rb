class UsersProduct
  include Mongoid::Document
  field :rnt_from, type: Time
  field :rnt_till, type: Time

  belongs_to  :customer, class_name: 'User'
  belongs_to  :product
  has_many    :messages
  belongs_to  :address
end
