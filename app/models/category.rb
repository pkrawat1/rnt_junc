class Category
  include Mongoid::Document
  field :name,    type: String
  field :desc,    type: String
  # Short name by joining first letter in each word
  field :s_name,  type: String

  has_many :sub_categories

  before_save :generate_short_name

  mount_uploader :logo, AvatarUploader

  def generate_short_name
    self.s_name = self.name.shortify
  end
end
