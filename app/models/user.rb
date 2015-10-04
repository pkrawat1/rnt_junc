class User
  include Mongoid::Document
  field :email,       type: String
  field :full_name,   type: String
  field :mobile,      type: String
  field :alt_mobile,  type: String

  embeds_many :addresses
  has_many :products
  has_many :users_products

  validates_presence_of :email, :full_name, :mobile
  validates_format_of   :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
end
