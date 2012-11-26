class ProjectsController < ApplicationController
  
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
end
