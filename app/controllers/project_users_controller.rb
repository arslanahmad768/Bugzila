class ProjectUsersController < ApplicationController
  load_and_authorize_resource
  def index
    # @project = params[:project_id]
    # puts "value is "
    # puts @project
  end
  def new
    @project = params[:project_id]
    puts "Value is :"
    puts @project
    # @user = User.where(userType:"developer")
  end
  def create
    @projectuser = ProjectUser.new(user_id:params[:user_id],project_id:params[:project_id])
    if @projectuser.save
      puts "Data is saved"
      redirect_to projects_path
    else
      render 'new'
    end
  end
end

