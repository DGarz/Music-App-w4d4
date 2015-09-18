class TracksController < ApplicationController

  def new
    @track = Track.new
    @album_id = params[:album_id].to_i
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      #need to make show page
      redirect_to album_url(@track.album_id)
    else
      render :new
    end
  end


  private

  def track_params
    params.require(:track).permit(:song_title, :bonus_or_regular, :album_id, :lyrics)
  end


end
