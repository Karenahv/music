class SongsController < ApplicationController
  def index
   @songs = Song.all
  end

  def new
      @song = Song.new
    end

    def create
      @song = Song.new(song_params)
      if @song.save
        redirect_to artists_path
      else
        render :new
      end
    end

  def show
   @song = Song.find(params[:id])
  end

  protected
    def song_params
      params.require(:song).permit(:name, :number, :preview_url, :album)
    end
end
