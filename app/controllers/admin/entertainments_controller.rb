class Admin::EntertainmentsController < AdminController
  unloadable
  
  def index
    add_breadcrumb "Entertainment"
    @entertainment_types = EntertainmentType.all
    @entertainments = Entertainment.all(:order => "title").paginate(:page => params[:page], :per_page => 50)    
  end
  def show
    redirect_to admin_entertainments_url
  end
  def new
    add_breadcrumb "Entertainment", admin_entertainments_path
    add_breadcrumb "New"
    @entertainment = Entertainment.new
    @entertainment_types = EntertainmentType.all
  end

  def create
     @entertainment = Entertainment.new(params[:entertainment])
    if @entertainment.save
      flash[:notice] = "#{@entertainment.title} has been added."
      redirect_to admin_entertainments_path()
    else
      add_breadcrumb "entertainment", admin_entertainments_path
      add_breadcrumb "New"
      @entertainment_types = EntertainmentType.all
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Entertainment", admin_entertainments_path
    add_breadcrumb "Edit"
    @entertainment = Entertainment.find(params[:id])
    @entertainment_types = EntertainmentType.all
  end

  def update
    @entertainment = Entertainment.find(params[:id])
    if @entertainment.update_attributes(params[:entertainment])
      flash[:notice] = " \"#{@entertainment.title}\" updated."
      redirect_to admin_entertainments_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @entertainment = Entertainment.find(params[:id])  
    @entertainment.destroy
    respond_to :js
  end

end