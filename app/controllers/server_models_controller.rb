class ServerModelsController < ApplicationController
  
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
    ServerModel.find(params[:id]).destroy
    flash[:success] = "Model destroyed."
    redirect_to server_models_url
  end
end
