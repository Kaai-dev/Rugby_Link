class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :nickname
      t.string :fullname
      t.string :cellphone_number
      t.integer :player_position
      t.string :medical_conditions
      t.boolean :has_id
      t.boolean :did_highschool
      t.string :medical_aid

      t.timestamps
    end
  end
end
