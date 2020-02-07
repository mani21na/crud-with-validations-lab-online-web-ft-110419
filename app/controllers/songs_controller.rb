class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    if @song = Song.new(song_params)
      @song.save
      redirect_to songs_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(:id)
  end

  def song_params
    params.request(:song).permit(:title, :relessed, :release_year, :artist_name, :genre)
  end
end
