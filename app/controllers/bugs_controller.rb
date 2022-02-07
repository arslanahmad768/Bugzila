class BugsController < ApplicationController
  # load_and_authorize_resource :nested => :project
  # load_and_authorize_resource :nested => :user
  load_and_authorize_resource
  def index
    @bugs = Bug.all
  end
  def new
    @bug = Bug.new
    @bug.project_id = params[:project_id]
  end
  def create
    @bug = Bug.new(bugs_params)
        if @bug.save
          redirect_to projects_path
        else
          render 'new'
        end
  end
  def bugs_params
    params.require(:projectuser).permit(:title,:description,:deadline,:bugType,:image,:status,:user_id,:project_id)
  end
end
