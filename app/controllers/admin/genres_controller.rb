class Admin::GenresController < AdminController
  unloadable
  before_filter :find_genre, :only => [:edit, :update, :destroy]
  
  def index
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "Artist Genres"
    @genres = Genre.all.paginate(:page => params[:page], :per_page => 50)    
  end
  
  def new
    add_breadcrumb "Artists", admin_artists_path
    add_breadcrumb "Artist Genres", admin_genres_path
    add_breadcrumb "New"
    @genre = Genre.new
  end
  
  def create
     @genre = Genre.new(params[:genre])
    if @genre.save
      flash[:notice] = "New artist type has been added."
      redirect_to admin_genres_path()
    else
      add_breadcrumb "Artists", admin_artists_path
      add_breadcrumb "Artist Genres", admin_genres_path
      add_breadcrumb "New"
      render :action => "new"
    end
  end

  def edit
    add_breadcrumb "Edit"
  end

  def update
    if @genre.update_attributes(params[:genre])
      flash[:notice] = "\"#{@genre.title}\" updated."
      redirect_to admin_genres_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @genre.destroy
    respond_to :js
  end
  
private
  def find_genre
    @genre = Genre.find_by_permalink(params[:id])
  end
end