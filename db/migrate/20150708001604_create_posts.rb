class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :pathToFile
      t.references :user
      t.references :comments
      t.references :likes
      t.timestamps null: false
    end
  end
end
