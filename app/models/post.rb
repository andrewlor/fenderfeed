class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes
  mount_uploader :pathToFile, PostUploader
end
