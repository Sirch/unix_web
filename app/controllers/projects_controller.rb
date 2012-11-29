class ProjectsController < ApplicationController
  
  before_filter :signed_in_user,  only: [:new, :create, :destroy]
  before_filter :admin_user,      only: [:edit, :update, :destroy]
  
  def new
    @project=Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end
  
  def index
    @projects = Project.paginate(
                                page: params[:page], 
                                order:  'name ASC'
                                )
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Project added"
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project destroyed."
    redirect_to :action => 'index'
  end
  
    private
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def admin_user
      unless (signed_in? && current_user.admin?)
               redirect_to(root_path)
      end
    end
end
