class ServerRacksController < ApplicationController
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
end
