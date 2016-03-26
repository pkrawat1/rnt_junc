class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name,      type: String
  field :desc,      type: String
  field :mft_date,  type: Date
  field :rent,      type: String

  mount_uploader :logo, AvatarUploader

  belongs_to  :sub_category
  belongs_to  :owner, class_name: 'User'
  has_many    :users_products

  validates_presence_of :name, :desc, :mft_date, :rent, :logo
end
