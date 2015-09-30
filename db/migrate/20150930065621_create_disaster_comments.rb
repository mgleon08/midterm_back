class CreateDisasterComments < ActiveRecord::Migration
  def change
    create_table :disaster_comments do |t|
      t.text :comment
      t.integer :disaster_id
      t.timestamps null: false
    end
  add_index :disaster_comments, :disaster_id
  end
end
