class RenameHasIdToPortraitPhoto < ActiveRecord::Migration[7.0]
  def change
    rename_column :players, :did_highschool, :portrait_photo
  end
end
