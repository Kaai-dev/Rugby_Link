class CreatePositions < ActiveRecord::Migration[7.1]
  def change
    create_table :positions, id: :uuid do |t|
      t.integer :number
      t.string :position

      t.timestamps
    end
  end
end
