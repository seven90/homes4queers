class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :listings, dependent: :destroy
  has_many :user_comments, as: :commentable, class_name:"Comment", dependent: :destroy
  has_many :listing_comments, through: :listings, source:"comments", dependent: :destroy
  acts_as_ordered_taggable
  mount_uploader :avatar, ImageUploader

  validates :password, length: { minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true

  # def self.results(query)
  # where("name LIKE ?", "%#{query}%") ||| tagged_with("%#{query}%")
  # end

  # def self.results(query)
  #   where("LOWER(name) LIKE LOWER(?)", "%#{query}%")
  # end
  #
  # def self.tag_results(query)
  #   tagged_with("%#{query}%")
  # end
end
