class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.references :user
      t.references :post
      t.timestamps null: false
    end
  end
end
