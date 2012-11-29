class ServerRacksController < ApplicationController
  
  before_filter :signed_in_user,  only: [:new, :create, :destroy]
  before_filter :admin_user,      only: [:edit, :update, :destroy]
  
  def new
  end

  def index
    @server_racks = ServerRack.paginate(page: params[:page], order: "name ASC")
  end

  def show
    @server_rack = ServerRack.find(params[:id])
  end

  def edit
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
