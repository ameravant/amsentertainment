class GenresController < ApplicationController
  unloadable

  def show
    @page = Page.find_by_permalink("artists")
    @genres = Genre.all
    @artist_types = ArtistType.all
    @genre = Genre.find_by_permalink(params[:id])
    @artists = @genre.artists
  end

end
