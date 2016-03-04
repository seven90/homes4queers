class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      results
    else
     @users = User.order("created_at DESC")
    end
  end

  def results
  @users = User.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%") \
    | User.tagged_with(params[:search])
  end


  def new
    @user = User.new

  end

  def show
    @commentable = User.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_back_or_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_back_or_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back_or_to listings_path
  end

  def favourite
    if Favourite.create(favourited: @user, user: current_user)
      redirect_to @user, notice: "Added to favourites"
    else
      redirect_to @user, alert: "Something went wrong, better blame the developers"
    end
  end

  def unfavourite
    if Favourite.where(favourited_id: @user.id, user_id: current_user.id).first.destroy
      redirect_to @user, notice: "Unfavourited this person (don't worry, we won't tell)"
    end
  end
  private

  def user_params
    #image is nested in a hash
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :about_me, :avatar, :tag_list)
  end
end
