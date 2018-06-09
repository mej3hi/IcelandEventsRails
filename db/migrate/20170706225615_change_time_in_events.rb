class ChangeTimeInEvents < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :data, :date
  end
end
