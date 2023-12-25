class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, 
         :rememberable, :validatable, authentication_keys: [:username]

  has_one_attached :user_profile_pic, dependent: :destroy
  has_one :user_setting, dependent: :destroy
  accepts_nested_attributes_for :user_setting


  # validates :email, uniqueness: true
  validates :username, uniqueness: true

  enum role: [:user, :coach, :admin]

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end

end
