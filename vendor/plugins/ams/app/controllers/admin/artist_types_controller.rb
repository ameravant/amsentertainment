class Admin::ArtistTypesController < AdminController
  unloadable
  before_filter :find_artist_type, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "Artist Types"
    @artist_types = ArtistType.all    
  end
  
  def new
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "Artist Types", admin_artist_types_path
    add_breadcrumb "New"
    @artist_type = ArtistType.new
  end
  
  def create
     @artist_type = ArtistType.new(params[:artist_type])
    if @artist_type.save
      flash[:notice] = "New artist type has been added."
      redirect_to admin_artist_types_path()
    else
      add_breadcrumb "Artists", admin_artists_path
      add_breadcrumb "Artist Types", admin_artist_types_path
      add_breadcrumb "New"
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Edit"
  end

  def update
    if @artist_type.update_attributes(params[:artist_type])
      flash[:notice] = "\"#{@artist_type.title}\" updated."
      redirect_to admin_artist_types_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @artist_type.destroy
    respond_to :js
  end
  
private
  def find_artist_type
    @artist_type = ArtistType.find(params[:id])
  end
end