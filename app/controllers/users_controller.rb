class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end

  def following
    user = User.find(params[:id])
    @users = user.followings(params[:id])
    render "show_follow"
  end

  def follower
    user = User.find(params[:id])
    @users = user.followers(params[:id])
    render "show_follower"
  end

end
