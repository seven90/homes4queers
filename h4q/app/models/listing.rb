class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :tags, as: :taggable
  has_many :images, as: :
  
  mount_uploader :image, ImageUploader
end
