# == Schema Information
#
# Table name: user_settings
#
#  id         :uuid             not null, primary key
#  dark_mode  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_user_settings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserSetting < ApplicationRecord
  belongs_to :user, inverse_of: :user_setting
end
