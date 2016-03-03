class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :tags, as: :taggable
  has_many :images

  geocoded_by :location

  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(query)
    where("LOWER(name) LIKE LOWER(?)", "%#{query}%")
  end
end
