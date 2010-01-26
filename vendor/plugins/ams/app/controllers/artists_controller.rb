class ArtistsController < ApplicationController
  unloadable
  before_filter :find_artist, :only => [:show]
  before_filter :find_nav
  def index
    if params[:genre]
      @genre = Genre.find(params[:genre])
      @artists = @genre.artists
    elsif params[:artist_type]
      @artist_type = ArtistType.find(params[:artist_type]) 
      @artists = @artist_type.artists
    else
      @artists = Artist.all
    end
    @page = Page.find_by_permalink("artists")
  end

  def show
    @page = Page.find_by_permalink("artists")
    @clips = @artist.assets.find_all_by_file_content_type("audio/mpg", "audio/mpeg")
  end


private
  def find_artist
    @artist = Artist.find(params[:id])
  end
  def find_nav
    @genres = Genre.all
    @artist_types = ArtistType.all
  end
end
