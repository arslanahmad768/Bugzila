class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = "Access denied."
    # redirect_to root_url
  # end
   def current_user
     @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
   end
  # def current_ability
  #   @current_ability ||= Ability.new(current_user)
  # end
end
