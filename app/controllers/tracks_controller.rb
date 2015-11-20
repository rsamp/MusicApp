class TracksController < ApplicationController
  before_action :require_logged_in!
  helper :tracks

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = @track.album
    @track.destroy
    redirect_to album_url(@album)
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :recording_type)
  end

end
