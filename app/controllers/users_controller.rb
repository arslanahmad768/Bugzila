class UsersController < ApplicationController
  def index
      @user = User.all
    end
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      puts @user
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path
      else
        puts "confirm true"
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:name,:email,:password,:userType)
    end
end
