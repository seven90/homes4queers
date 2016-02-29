class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :listings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :comments, through: :listings, dependent: :destroy
  has_many :tags, as: :taggable
  mount_uploader :image, ImageUploader

  validates :password, length: { minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end
