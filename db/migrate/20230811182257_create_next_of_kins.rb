class CreateNextOfKins < ActiveRecord::Migration[7.0]
  def change
    create_table :next_of_kins, id: :uuid do |t|
      t.uuid :player_id, null: false
      t.string :name
      t.string :cellphone_number
      t.string :relationship
      t.timestamps
    end
      add_foreign_key :next_of_kins, :players, column: :player_id
  end
end
