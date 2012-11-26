class ServerRacksController < ApplicationController
  def new
  end

  def index
  end

  def show
    @server_rack = ServerRack.find(params[:id])
  end

  def edit
  end
end
