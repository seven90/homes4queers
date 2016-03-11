class ListingsController < ApplicationController
  before_action :require_login

  def index
    @q = Listing.ransack(params[:q])
    if params[:q]
      @listings = @q.result.distinct.page(params[:page]).per(10)
      @q.build_condition if @q.conditions.empty?
      @q.build_sort if @q.sorts.empty?
      # @listings = Listing.near(params[:search])
    elsif params[:latitude] && params[:longitude]
      @listings = Listing.near([params[:latitude], params[:longitude]])
    else
      @listings = Listing.order("created_at DESC").page(params[:page]).per(10)
    #  @listings = Listing.order("created_at DESC").page(params[:page])
    end


    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def search
    index
    render :index
  end

  def new
    @listing = Listing.new
  end

  def show
    @commentable = Listing.find(params[:id])
    @listing = Listing.find(params[:id])
    @nearby_listings = @listing.nearbys_if_geocoded

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_back_or_to listing_path(@listing), notice: 'Successfully created a listing!'
    else
      render :new
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      redirect_back_or_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def favourite
    @listing = Listing.find(params[:id])
    if Favourite.create(favourited: @listing, user: current_user)
      redirect_to :back, notice: "Added to favourites"
    else
      redirect_to :back, alert: "Something went wrong, better blame the developers"
    end
  end

  def unfavourite
    @listing = Listing.find(params[:id])
    if Favourite.where(favourited_id: @listing.id, user_id: current_user.id).last.destroy
      redirect_to :back, notice: "Unfavourited listing"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :location, :user_id, :roomates, :bedrooms, :price, :basement, :sublet, :rent_date, images_attributes: [:photo])
  end

end
