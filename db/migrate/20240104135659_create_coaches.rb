class CreateCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches, id: :uuid do |t|
      # t.belongs_to :teams
      t.string :nickname
      t.string :fullname
      t.string :encrypted_cellphone_number
      t.string :encrypted_cellphone_number_iv
      t.text :medical_conditions
      t.string :medical_aid
      t.string :encrypted_id_number
      t.string :encrypted_id_number_iv

      t.timestamps
    end
  end
end
