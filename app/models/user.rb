# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user")
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
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
