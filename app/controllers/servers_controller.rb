class ServersController < ApplicationController
  def new
    @project_lookup=Project.names
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems
    @server=Server.new
    
  end

  def index
    @servers = Server.paginate(page: params[:page])
  end

  def show
  end

  def edit
  end
end
