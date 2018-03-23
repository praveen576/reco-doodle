class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :roleusers
  has_many :roles, through: :roleusers

  validates_presence_of [:email, :password]

  def role?(*roles)
    ((self.roles.map(&:name)) & roles.map(&:to_s)).present?
  end

  def is_admin?
  	self.role? ("admin")
  end

end
