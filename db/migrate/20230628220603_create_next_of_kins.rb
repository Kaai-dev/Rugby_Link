class CreateNextOfKins < ActiveRecord::Migration[7.0]
  def change
    create_table :next_of_kins do |t|
      t.string :name
      t.string :cellphone_number
      t.string :relationship

      t.timestamps
    end
  end
end
