class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    @q = User.ransack(params[:q])

    if params[:q]
      @users = @q.result.distinct
      # results
    else
     @users = User.all
    end
  end

  def search
    index
    render :index
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
    @auth_token = User.find_by token:(params[:token])
    if @auth_token
      @user = User.new(user_params)
      if @user.save
        redirect_back_or_to user_path(@user)
      else
        render :new
      end
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
    @user = User.find(params[:id])
    if Favourite.create(favourited: @user, user: current_user)
      redirect_to :back, notice: "Added to favourites"
    else
      redirect_to :back, alert: "Something went wrong, better blame the developers"
    end
  end

  def unfavourite
    @user = User.find(params[:id])
    if Favourite.where(favourited_id: @user.id, user_id: current_user.id).first.destroy
      redirect_to :back, notice: "Successfully unfavourited someone (they'll never know)"
    end
  end

  private

  def user_params
    #image is nested in a hash
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :about_me, :avatar, :tag_list)
  end


end
