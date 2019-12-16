class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    render :form
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to song_path(@song)
  end

  def show
    song =  Song.find(params[:id])
    @song = song
    @artist = Artist.find(song.artist_id)
    @genre = Genre.find(song.genre_id)
  end

  def edit
    @song = Song.find(params[:id])
    render :form
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private
  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
