class ArtistsController < ApplicationController
  def index
   @artists = Artist.all
  end

  def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.new(artist_params)
      if @artist.save
        redirect_to artists_path
      else
        render :new
      end
    end

  def show
   @artist = Artist.find(params[:id])
   @albums = @artist.albums
  end


  protected
    def artist_params
      params.require(:artist).permit(:name, :image_url)
    end

    def album_params
      params.require(:album).permit(:name, :image_url, :released_at, :artist)
    end
end
