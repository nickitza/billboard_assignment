class SongsController < ApplicationController
  # before_action :set_artist
  before_action :set_billboard
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    # @songs = @billboard.songs
  end

  def show
  end

  def edit
    render partial: "form"
  end

  def update
    if @song.update(song_params)
      redirect_to billboard_path(@billboard)
    else
      render partial: "form"
    end
  end

  def new
    @song = @billboard.songs.new
    render partial: "form"
  end

  def create
    @song = @billboard.songs.new(song_params)
    if @song.save
      redirect_to billboard_path(@billboard)

    else
      render partial: "form"
    end
  end

  def destroy
    @song.destroy
    redirect_to billboard_path(@billboard)
  end

  private
  # def set_artist
  #   @artist = Artist.find(params[:artist_id])
  # end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end

    def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
    end

end
