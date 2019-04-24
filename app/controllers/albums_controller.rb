class AlbumsController < ApplicationController
  def index
   @albums = Album.all
  end

  def new
      @album = Album.new
    end

    def create
      @album = Album.new(album_params)
      if @album.save
        redirect_to artists_path
      else
        render :new
      end
    end

  def show
   @album = Album.find(params[:id])
  end

  protected
    def album_params
      params.require(:album).permit(:name, :image_url, :released_at, :artist)
    end
end
