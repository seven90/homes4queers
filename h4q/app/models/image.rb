class Image < ActiveRecord::Base
  belongs_to :listing
  has_one :user, through: :listing
end
