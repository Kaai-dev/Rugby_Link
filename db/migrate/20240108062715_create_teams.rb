class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.references :coach, null: false, foreign_key: true, type: :uuid
      t.references :players, null: false, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
