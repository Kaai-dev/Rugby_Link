class ChangePlayerPositionInPlayersToArray < ActiveRecord::Migration[7.0]
  def up
    change_column :players, :player_position, :integer, array: true, default: [], using: 'ARRAY[player_position]::INTEGER[]'
  end

  def down
    change_column :players, :player_position, :integer, array: false, using: 'player_position[1]::INTEGER'
  end
end