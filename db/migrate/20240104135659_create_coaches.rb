class CreateCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches, id: :uuid do |t|
      # t.belongs_to :teams
      t.string :nickname
      t.string :fullname
      t.string :cellphone_number
      t.text :medical_conditions
      t.string :medical_aid
      t.string :id_number
      
      t.timestamps
    end
  end
end
