class FavoritesController < ApplicationController
  def create
    @project = Project.find(params[:id])
    @favorite = Favorite.new(project_id: @project.id, user_id: current_user.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    @project = Project.find(@favorite.project_id)
  end

end
