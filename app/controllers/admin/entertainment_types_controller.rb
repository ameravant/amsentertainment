class Admin::EntertainmentTypesController < AdminController
  unloadable
  before_filter :find_entertainment_type, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Entertainment", admin_entertainments_path
    add_breadcrumb "Entertainment Types"
    @entertainment_types = EntertainmentType.all    
  end
  def show
    render :index
  end
  def new
    add_breadcrumb "Entertainment", admin_entertainments_path
    add_breadcrumb "Entertainment Types", admin_entertainment_types_path
    add_breadcrumb "New"
    @entertainment_type = EntertainmentType.new
  end
  
  def create
     @entertainment_type = EntertainmentType.new(params[:entertainment_type])
    if @entertainment_type.save
      flash[:notice] = "New entertainment type has been added."
      redirect_to admin_entertainment_types_path()
    else
      add_breadcrumb "Entertainment", admin_entertainments_path
      add_breadcrumb "Entertainment Types", admin_entertainment_types_path
      add_breadcrumb "New"
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Edit"
  end

  def update
    if @entertainment_type.update_attributes(params[:entertainment_type])
      flash[:notice] = "\"#{@entertainment_type.title}\" updated."
      redirect_to admin_entertainment_types_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @entertainment_type.destroy
    respond_to :js
  end
  
private
  def find_entertainment_type
    @entertainment_type = EntertainmentType.find(params[:id])
  end
end