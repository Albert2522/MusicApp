class TracksController < ApplicationController
    before_action :require_login
    def new

    end

    def create
      @track = Track.new(tracks_params)
      if @track.save
        redirect_to track_url(@track.id)
      else
        flash.now[:error] = @track.errors.full_messages
        render :index
      end
    end

    def index
      @tracks = Track.all
    end

    def show
      @track = Track.find_by(id: params[:id])
    end

    def edit
      @track = Track.find_by(id: params[:id])
    end

    def update
      @track = Track.find_by(id: params[:id])
      if @track.update(tracks_params)
        redirect_to tracks_url
      else
        render :edit
      end
    end

    def destroy
      @track = Track.find_by(id: params[:id])
      if @track.destroy
        redirect_to tracks_url
      else
        render :index
      end
    end

    private

    def tracks_params
      params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
    end
end
