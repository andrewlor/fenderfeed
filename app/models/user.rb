class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  mount_uploader :pathToFile, AvatarUploader
end
