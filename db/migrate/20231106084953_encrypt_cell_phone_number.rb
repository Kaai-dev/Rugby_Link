class EncryptCellPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    rename_column :players, :cellphone_number, :encrypted_cellphone_number
    add_column :players, :encrypted_cellphone_number_iv, :string
  end
end
