class FavoritesController < ApplicationController
  def create
    @user_id = current_user.id
    @project_id = Project.find(params[:id]).id
    @favorite = Favorite.new(project_id: @project_id, user_id: @user_id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

end
