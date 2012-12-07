class ServerModelsController < ApplicationController

  before_filter :signed_in_user,  only: [:new, :create, :destroy]
  before_filter :admin_user,      only: [:edit, :update, :destroy]
  
  def new
  end

  def show
    @server_model = ServerModel.find(params[:id])
  end

  def edit
    @server_model = ServerModel.find(params[:id])
  end
  
  def index
    @server_models = ServerModel.paginate(page: params[:page], order: "name ASC")
  end
  
  def update
    @server_model = ServerModel.find(params[:id])
    if @server_model.update_attributes(params[:server_model])
      redirect_to server_models_url
    end
  end
  
  def destroy
    @server_model = ServerModel.find(params[:id])
    unless @server_model.server.count == 0
      flash[:error] = "Model in use."
      render "shared/nope"
    else
      @server_model.destroy
      flash[:success] = "Model destroyed."
      redirect_to server_models_url
    end
    
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
