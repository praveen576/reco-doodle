class User < ApplicationRecord
  has_many :roles, through: :roleusers
end
