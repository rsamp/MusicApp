class AlbumsController < ApplicationController
  before_action :require_logged_in!

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band
    @album.destroy!
    redirect_to band_url(@band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
