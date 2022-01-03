class User < ApplicationRecord
  has_secure_password
  # attr_accessible :email, :name, :password, :password_confirmation
  validates :password, presence:true, length:{within:8..32}, confirmation:true
end
