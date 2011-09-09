class ArtistsController < ApplicationController
  unloadable
  before_filter :find_artist, :only => [:show]
  before_filter :find_nav
  def index
    if params[:genre]
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
    if @artist.images
      @images = @artist.images
    end
    @clips = @artist.assets.find(:all, :conditions => ["file_file_name LIKE ?", "%.mp3"])
    @testimonial = Testimonial.find(:all, :conditions => ["quotable_id = ?" , @artist.id]).sort_by(&:rand).first #Select a random testimonial
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
