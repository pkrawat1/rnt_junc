class User
  include Mongoid::Document
  field :email,       type: String
  field :full_name,   type: String
  field :mobile,      type: String
  field :alt_mobile,  type: String

  embeds_many :addresses
end
