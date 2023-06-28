class CreateIdNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :id_numbers do |t|
      t.string :id_number

      t.timestamps
    end
  end
end
