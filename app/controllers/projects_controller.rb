class ProjectsController < ApplicationController
  def index

  end
  def new
    @project = Project.new
  end
  def create
    puts project_params
    @user = User.find(params[:user_id])
    @project = @user.projects.create(project_params)
    redirect_to user_path
  end

  private
  def project_params
    params.require(:project).permit(:title,:description,:user_id)
  end
end
