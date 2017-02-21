class UsersController < ApplicationController
  before_action :find_user, only: [:show, :following, :follower]

  def show
    @favorites = Favorite.where(user_id: @user.id)
  end

  def following
    @users = user.followings(params[:id])
    render "show_follow"
  end

  def follower
    @users = user.followers(params[:id])
    render "show_follower"
  end

  private

  def find_user
    user = User.find(params[:id])
  end

end
