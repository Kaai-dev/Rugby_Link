class CreateAbsences < ActiveRecord::Migration[7.0]
  def change
    create_table :absences, id: :uuid do |t|
      t.uuid :player_id, null: false
      t.string :reason
      t.boolean :absent_game_day
      t.boolean :absent_train_day

      t.timestamps
    end
    add_foreign_key :absences, :players, column: :player_id
  end
end
