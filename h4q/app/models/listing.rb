class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :tags, as: :taggable
  has_many :images

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(query)
    where("LOWER(name) LIKE LOWER(?)", "%#{query}%")
  end

  def display_distance_in_meters(other_listing)
    self.distance_to(other_listing, :km).round(3)
  end

  def thumbnail
    if images.any?
      images.first.photo.thumb
    end
  end

  def nearbys_if_geocoded
    if latitude && longitude
      self.nearbys
    else
      []
    end
  end

end
