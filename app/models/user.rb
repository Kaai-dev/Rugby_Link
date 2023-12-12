class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable, authentication_keys: [:username]

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end

end
