class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :listings
  has_many :comments, as: :commentable
  has_many :comments, through: :listings
  has_many :tags, as: :taggable
  has_many :images, as: :imageable
  attr_accessor :images
end
