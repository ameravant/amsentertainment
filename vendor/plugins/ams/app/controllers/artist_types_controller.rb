class ArtistTypesController < ApplicationController
  unloadable

  def show
    @page = Page.find_by_permalink("artists")
    @genres = Genre.all
    @artist_types = ArtistType.all
    @artist_type = ArtistType.find_by_permalink(params[:id])
    @artists = @artist_type.artists
  end

end