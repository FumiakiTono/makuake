class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:relationship][:follower_id])
    current_user.follow(current_user, @user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).follower
    current_user.unfollow(current_user, @user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

end
