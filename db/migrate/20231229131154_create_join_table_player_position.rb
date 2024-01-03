class CreateJoinTablePlayerPosition < ActiveRecord::Migration[7.1]
  def change
    create_join_table :players, :positions, column_options: { type: :uuid } do |t|
      # The table is automatically created with no id column
      t.index :player_id
      t.index :position_id
    end
  end
end
