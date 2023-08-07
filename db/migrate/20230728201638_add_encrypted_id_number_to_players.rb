class AddEncryptedIdNumberToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :encrypted_id_number, :string
  end
end
