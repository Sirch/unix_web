class ServersController < ApplicationController
  def new
    @project_lookup=Project.names
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems
    @server=Server.new
    
  end

  def index
    @servers = Server.all
  end
  
  def create
    #@server=Server.new(params[:server])
    @server=Server.new
    
    rack_name             = params[:server][:server_rack].upcase
    parent                = params[:server][:parent]
    model                 = params[:server][:server_model]
    project               = params[:server][:project]
    @server.name          = params[:server][:name]
    @server.datacenter_id = params[:server][:datacenter_id]
    @server.serial        = params[:server][:serial]
    @server.operating_system = params[:server][:operating_system]
    @server.cpu_number    = params[:server][:cpu_number]
    @server.cpu_type      = params[:server][:cpu]
    @server.ram           = params[:server][:ram]
    @server.environment   = params[:server][:environment]
    @server.usage         = params[:server][:usage]
    @server.oob_address   = params[:server][:oob_address]
    
    # If this server has a parent, find the ID
    if parent != ''
      @server.parent_id = Server.get_id(parent)
      @server.server_rack_id  = @server.parent.server_rack.id
      @server.datacenter_id   = @server.parent.datacenter.id
      rack_name = @server.server_rack.name
    end
    
    
    # Get the ID of the rack, and create it if it doesnt exist.
    if rack_name != '' and s=ServerRack.get_id(@server.datacenter_id, rack_name)
      @server.server_rack_id = s
    else
      rack = ServerRack.new
      rack.name = rack_name
      rack.datacenter_id = @server.datacenter_id
      rack.save
      @server.server_rack_id = rack.id
    end
    
    # Get the ID of the model, and create if it doesnt exist.
    if m=ServerModel.get_id(model)
      @server.server_model_id = m
    else
      server_model = ServerModel.new
      server_model.name = model
      server_model.save
      @server.server_model_id = server_model.id     
    end
 
    if project != ''
      @server.project_id = Project.get_id(project)
    end
    
    if signed_in?
      @server.added_by=current_user.id
    end
    
   
    
    if @server.save
      index
    render 'index'
    #else
    #  render 'new'
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def edit
    @project_lookup=Project.names
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems
    @server = Server.find(params[:id])
  end
end
