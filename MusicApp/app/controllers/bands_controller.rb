class BandsController < ApplicationController
  before_action :require_login

  def new

  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def create
    @band = Band.new(bands_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      flash.now[:error] = @band.errors.full_messages
      render :index
    end
  end

  def index
    @bands = Band.all
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(bands_params)
      redirect_to bands_url
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band.destroy
      redirect_to bands_url
    else
      render :index
    end
  end

  private

  def bands_params
    params.require(:band).permit(:name)
  end
end
