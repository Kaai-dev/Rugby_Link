class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players, id: :uuid do |t|
      t.string :nickname
      t.string :fullname
      t.string :encrypted_cellphone_number
      t.string :encrypted_cellphone_number_iv
      t.string :medical_conditions
      t.string :medical_aid
      t.string :encrypted_id_number
      t.string :encrypted_id_number_iv

      t.timestamps
    end
  end
end
