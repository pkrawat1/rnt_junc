class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  
  field :full_name,   type: String
  field :mobile,      type: String
  field :alt_mobile,  type: String
  field :admin,       type: Boolean

  embeds_many :addresses
  has_many :products
  has_many :users_products

  validates_presence_of :email, :full_name, :mobile
  validates_format_of   :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/
  
  belongs_to :role

  delegate :name, to: :role, prefix: :role
  accepts_nested_attributes_for :addresses

  def role?(role_name)
    self.role_name.eql?(role_name)
  end

end
