class AddPlayerIdToIdNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :id_numbers, :player, null: false, foreign_key: true
  end
end
