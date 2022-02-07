class ProjectsController < ApplicationController
  # load_and_authorize_resource :nested => :user
    load_and_authorize_resource
  def index
    # @project = Project.where(user_id:current_user.id)
    @project = Project.all
    # authorize! :read, @project
  end
  def new
    @project = Project.new
  end
  def create
    # byebug
    @user = User.find(params[:project][:user_id])
    @project = Project.new(project_params)
    @project.save
    # @project = @user.projects.create(project_params)
    redirect_to projects_path
  end
  def show
    @project = Project.find(params[:id])
  end

  def edit
      @project = Project.find(params[:id])
  end

  def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to project_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
      @project = Project.find(params[:id])
      @project.destroy

      redirect_to project_path
  end


  private
  def project_params
    params.require(:project).permit(:title,:description,:user_id)
  end
end
