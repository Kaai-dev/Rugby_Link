class CreateUserSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_settings, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.boolean :dark_mode, default: false

      t.timestamps
    end
  end
end
