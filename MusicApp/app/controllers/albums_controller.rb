class AlbumsController < ApplicationController

    def new
    end

    def create
      @album = Album.new(albums_params)
      if @album.save
        redirect_to album_url(@album.id)
      else
        flash.now[:error] = @album.errors.full_messages
        render :index
      end
    end

    def index
      @albums = Album.all
    end

    def show
      @album = Album.find_by_id(params[:id])
    end

    def edit
      @album = Album.find_by_id(params[:id])
    end

    def update
      @album = Album.find_by_id(params[:id])
      if @album.update(albums_params)
        redirect_to albums_url
      else
        render :edit
      end
    end

    def destroy
      @album = Album.find_by_id(params[:id])
      if @album.destroy
        redirect_to albums_url
      else
        render :index
      end
    end

    private

    def albums_params
      params.require(:album).permit(:band_id, :album_type, :name)
    end
end
