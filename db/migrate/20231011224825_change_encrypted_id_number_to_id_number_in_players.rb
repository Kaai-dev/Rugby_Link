class ChangeEncryptedIdNumberToIdNumberInPlayers < ActiveRecord::Migration[7.0]
  def change
    rename_column :players, :id_number, :encrypted_id_number
    add_column :players, :encrypted_id_number_iv, :string
  end
end
