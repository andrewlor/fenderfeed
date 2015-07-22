class AddUploadVarToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :uploadCustomPic
    end
  end
end
