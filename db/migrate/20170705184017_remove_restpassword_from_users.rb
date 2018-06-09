class RemoveRestpasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :resetpasswordexpires
    remove_column :users, :resetpasswordtoken

  end
end
