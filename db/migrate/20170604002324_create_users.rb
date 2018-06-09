class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :resetpasswordtoken
      t.string :resetpasswordexpires
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
