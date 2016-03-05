class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favourited, polymorphic: true
end
