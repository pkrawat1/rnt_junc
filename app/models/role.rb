class Role
  include Mongoid::Document
  field :name, type: Symbol

  has_many :users
end
