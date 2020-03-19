class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def show
    @destination = Destination.find(params[:id])
    @posts = Post.all
  end

  def new
    @destination = Destination.new(params[:id])
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    redirect_to destination_path(@destination)
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    redirect_to destinations_path
  end


  private
  def destination_params
    params.require(:destination).permit(:name, :country)
  end

end
