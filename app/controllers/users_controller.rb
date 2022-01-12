class UsersController < ApplicationController
  # load_and_authorize_resource

  def index
      @project = Project.all
    end
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to projects_path
      else
        puts "confirm true"
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end
    def edit
      @user = User.find(params[:id])
    end
    def update
    end
    private
    def user_params
      params.require(:user).permit(:name,:email,:password,:userType)
    end
end
