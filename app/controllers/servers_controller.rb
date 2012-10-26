class ServersController < ApplicationController
  def new
    @server=Server.new
    @project_lookup=Project.select([:id,:name])
  end

  def index
    @servers = Server.paginate(page: params[:page])
  end

  def show
  end

  def edit
  end
end
