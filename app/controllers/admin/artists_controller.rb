class Admin::ArtistsController < AdminController
  unloadable
  
  def index
    add_breadcrumb "Artists"
    @artist_types = ArtistType.all
    @artists = Artist.all(:order => "title").paginate(:page => params[:page], :per_page => 50)    
  end
  def show
    redirect_to admin_artists_url
  end
  def new
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "New"
    @artist = Artist.new
    @artist.price = 1
    @artist_types = ArtistType.all
    @genres = Genre.all
  end

  def create
     @artist = Artist.new(params[:artist])
    if @artist.save
      flash[:notice] = "New artist has been added."
      redirect_to admin_artists_path()
    else
      add_breadcrumb "Artists", admin_artists_path
      add_breadcrumb "New"
      @artist_types = ArtistType.all
      @genres = Genre.all
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "Edit"
    @artist = Artist.find(params[:id])
    @artist_types = ArtistType.all
    @genres = Genre.all
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      flash[:notice] = " \"#{@artist.title}\" updated."
      redirect_to admin_artists_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])  
    @artist.destroy
    respond_to :js
  end

end