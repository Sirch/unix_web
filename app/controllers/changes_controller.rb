class ChangesController < ApplicationController
  
  PER_PAGE = 20
  
  def new
    @change = Change.new
  end

  def index
    
    if params[:change]
      @search = params[:change][:search]
      @changes = Change.search(@search).paginate(page: params[:page], per_page: PER_PAGE, order: "id DESC")
    else
      @changes = Change.paginate(page: params[:page], per_page: PER_PAGE, order: "id DESC")
    end
  end

  def show
     @change = Change.find(params[:id])
  end

  def edit
  end

  def search
  end
  
  def create
    @change = Change.new(params[:change])
    if signed_in?
      @change.user_id = current_user.id
    end
    if @change.save
      index
      render 'index'
    else
      render 'new'
    end
  end
  
  def destroy
    Change.find(params[:id]).destroy
    flash[:success] = "Change destroyed."
    index
    render 'index'
  end
end
