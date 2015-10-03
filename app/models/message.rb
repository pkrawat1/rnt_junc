class Message
  include Mongoid::Document
  field :msg,  type: String
  field :time, type: Time

  belongs_to :users_product
  belongs_to :sender, class_name: 'User'
end
