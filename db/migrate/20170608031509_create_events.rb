class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :location
      t.date :data
      t.string :time
      t.string :imageurl
      t.string :description
      t.string :musicgenres

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
