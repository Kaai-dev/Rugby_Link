class AddPlayerIdToNextOfKin < ActiveRecord::Migration[7.0]
  def change
    add_reference :next_of_kins, :player, null: false, foreign_key: true
  end
end
