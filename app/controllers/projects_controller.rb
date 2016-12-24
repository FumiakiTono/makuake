class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def search
    @projects = Project.where("title LIKE(?)", "%#{params[:keyword]}%").limit(10)
  end

  def apply
  end

  def show
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
