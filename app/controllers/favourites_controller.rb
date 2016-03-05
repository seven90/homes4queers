class FavouritesController < ApplicationController
  def index
    @favourite_users = current_user.favourite_users
    @favourite_listings = current_user.favourite_listings
  end

  ##create and destroy methods for favourites are in users and listings controllers as 'favourite' and 'unfavourite'
end
