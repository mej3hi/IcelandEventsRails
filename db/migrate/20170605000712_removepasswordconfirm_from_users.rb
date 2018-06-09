class RemovepasswordconfirmFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :passwordconfirm
  end
end
