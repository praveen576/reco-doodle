class Role < ApplicationRecord

  has_many :roleusers
  has_many :users, through: :roleusers

end
