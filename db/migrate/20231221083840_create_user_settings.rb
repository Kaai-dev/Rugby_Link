class CreateUserSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_settings, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.boolean :dark_mode, null: false, default: false

      t.timestamps
    end
  end
end
