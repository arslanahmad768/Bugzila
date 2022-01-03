class SessionsController < ApplicationController
  def create
      @user = User.find_by(email:params[:email])
      #Authenticate user cridential
      if !!@user && @user.authenticate(params[:password])
        #set session and redirect on success
        session[:user_id] = @user.id
        redirect_to user_path
      else
        #error message on fail
        message = "something went wrong! make sure your email and password are same"
        redirect_to login_path, notice: message
      end
    end
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: 'Logged out!'
    end
end
