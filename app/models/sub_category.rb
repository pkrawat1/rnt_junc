class SubCategory
  include Mongoid::Document
  field :name, type: String

  mount_uploader :logo, AvatarUploader
  
  belongs_to :category
end
