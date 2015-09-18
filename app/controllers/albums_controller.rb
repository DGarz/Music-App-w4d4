class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @band_id = params[:band_id].to_i
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save!
      redirect_to band_url(@album.band_id)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :live_or_studio)
  end
end
