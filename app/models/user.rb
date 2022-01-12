class User < ApplicationRecord
  has_secure_password
  has_many:projects
  # attr_accessible :email, :name, :password, :password_confirmation
  validates :password, presence:true, length:{within:8..32}, confirmation:true
  enum userType: [:manager,:developer,:qa]
end
