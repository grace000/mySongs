class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :url, null: false
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps null: false 
    end

    add_index :posts, [:user_id, :title]

  end
end
