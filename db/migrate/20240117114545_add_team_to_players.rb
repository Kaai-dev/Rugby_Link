class AddTeamToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :players, :team, null: true, foreign_key: true, type: :uuid
  end
end
