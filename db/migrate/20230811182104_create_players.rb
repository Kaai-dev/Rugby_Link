class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid do |t|
      t.string :nickname
      t.string :fullname
      t.string :cellphone_number
      t.boolean :player_position
      t.text :medical_conditions
      t.boolean :has_id
      t.string :portrait_photo
      t.string :medical_aid
      t.string :encrypted_id_number
      t.timestamps
    end
  end
end
