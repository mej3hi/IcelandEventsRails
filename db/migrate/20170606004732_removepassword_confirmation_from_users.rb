class RemovepasswordConfirmationFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_confirmation
  end
end
