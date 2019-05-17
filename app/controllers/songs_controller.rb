class SongsController < ApplicationController
  before_action :set_artist, only: [:index]
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs
  end

  def show
  end

  def edit
    @billboard = Billboard.find(params[:billboard_id])
    render partial: "form"
  end

  def update
    @billboard = Billboard.find(params[:billboard_id])
    if @song.update(song_params)
      redirect_to billboard_path(@billboard.id)
    else
      render partial: "form"
    end
  end

  def new
    @billboard = Billboard.find(params[:billboard_id])
    @song = @billboard.songs.new
    render partial: "form"
  end

  def create
    @billboard = Billboard.find(params[:billboard_id])
    @song = @billboard.songs.new(song_params)
    if @song.save
      redirect_to billboard_song_path(@billboard.id, @song.id)
    else
      render partial: "form"
    end
  end

  def destroy
    @song.destroy
    redirect_to billboard_songs_path(@billboard.id)
  end

  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end

  #   def set_billboard
  #   @billboard = Billboard.find(params[:billboard_id])
  # end

end
