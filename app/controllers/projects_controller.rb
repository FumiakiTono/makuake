class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    respond_to do |format|
      format.html
      format.json {
        render json: { id: current_user.id }
      }
    end
  end

  def search
    @projects = Project.where("title LIKE(?)", "%#{params[:keyword]}%").limit(10)
  end

  def apply
  end

  def show
    @project = Project.find(params[:id])
    @favorite = Favorite.new
    @today = Date.today
    @finaldate = @project.finaldate
    difdate = @finaldate - @today
    @difdate = difdate.to_i
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to root_path
  end

  def pay1
  end

  def pay2
  end

  def pay3
  end

  private
  def project_params
    params.require(:project).permit(:title, :finalprice, :finaldate, :description)
  end

end
