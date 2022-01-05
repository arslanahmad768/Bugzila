class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
  def new
    @project = Project.new
  end
  def create
    # byebug
    @user = User.find(params[:project][:user_id])
    puts "print receive parameter"
    puts project_params
    @project = Project.new(project_params)
    @project.save
    # @project = @user.projects.create(project_params)
    redirect_to user_path
  end
  def edit
      @project = Project.find(params[:id])
  end
  def show
    @project = Project.find(params[:id])
  end
  def update
      @project = Project.find(params[:id])

      if @project.update(project_params)
        redirect_to user_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
      @project = Project.find(params[:id])
      @project.destroy

      redirect_to user_path
  end


  private
  def project_params
    params.require(:project).permit(:title,:description,:user_id)
  end
end
