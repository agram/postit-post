class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_title :posts
  end
end
