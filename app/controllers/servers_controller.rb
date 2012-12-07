class ServersController < ApplicationController
  
  before_filter :signed_in_user,  only: [:new, :clone, :create, :destroy]
  before_filter :admin_user,      only: [:edit, :update, :destroy]

  
  def new
    @project_lookup=Project.names
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems
    @server=Server.new
    
  end

  def index
    # Middleware want to show based on the servername 
    #   ie /servers?show=ap101
    # So index unless this parameter is sent
    unless (params[:show]) 
      @servers = Server.all
    else 
      if @server = Server.where(name: params[:show]).first
        redirect_to @server
      else
        render "static_pages/not_found"
      end
    end
  end
  
  def create
    #@server=Server.new(params[:server])
    @server=Server.new
    
    rack_name             = params[:server][:server_rack_name].strip.upcase
    parent                = params[:server][:parent].strip
    model                 = (params[:server][:server_model_name]).strip
    project               = params[:server][:project_name].strip
    @server.name          = params[:server][:name].strip
    @server.datacenter_id = params[:server][:datacenter_id]
    @server.serial        = params[:server][:serial].strip
    @server.operating_system = params[:server][:operating_system].strip
    @server.cpu_number    = params[:server][:cpu_number]
    @server.cpu_type      = params[:server][:cpu_type].strip
    @server.ram           = params[:server][:ram]
    @server.environment   = params[:server][:environment].strip
    @server.usage         = params[:server][:usage].strip
    @server.oob_address   = params[:server][:oob_address].strip
    
    # If this server has been given a parent, find the parent_id
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
      flash[:success] = "#{@server.name} added."
      redirect_to @server
    #else
    #  render 'new'
    end
  end

  def show
    @server = Server.find(params[:id])
  end

  def edit
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems
    @server = Server.find(params[:id])
  end
  
  def update
    @server = Server.find(params[:id])
    
    parent                = params[:server][:parent].strip
    model                 = (params[:server][:server_model]).strip
    @server.project_id    = params[:server][:project_id]
    @server.name          = params[:server][:name].strip
    @server.serial        = params[:server][:serial].strip
    @server.operating_system = params[:server][:operating_system].strip
    @server.cpu_number    = params[:server][:cpu_number]
    @server.cpu_type      = params[:server][:cpu_type].strip
    @server.ram           = params[:server][:ram]
    @server.environment   = params[:server][:environment].strip
    @server.usage         = params[:server][:usage].strip
    @server.oob_address   = params[:server][:oob_address].strip
    
    # If this server has a parent, find the ID
    if parent != ''
      @server.parent_id = Server.get_id(parent)
      @server.server_rack_id  = @server.parent.server_rack.id
      @server.datacenter_id   = @server.parent.datacenter.id
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
    
    if signed_in?
      @server.edited_by=current_user.id
    end
    
    
    if @server.save
      flash[:success] = "#{@server.name} edited."
      redirect_to server_url
    end
  end
  
  def clone
    @project_lookup=Project.names
    @server_lookup=Server.names
    @operating_system_lookup=Server.operating_systems

    @server = Server.find(params[:id]).dup
    @server.server_rack_name = @server.server_rack.name
    @server.server_model_name = @server.server_model.name
    @server.project_name = @server.project.name
  end
  
  def destroy
    flash[:error] = "Im not sure we should delete servers"
    render "shared/nope"
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
