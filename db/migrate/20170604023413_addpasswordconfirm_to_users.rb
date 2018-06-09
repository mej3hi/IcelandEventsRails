class AddpasswordconfirmToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :passwordconfirm, :string
  end
end
