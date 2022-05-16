class ResortsController < ApplicationController
  def index
    @resorts = Resort.order_by_created_time
  end

  def show
    @resort = Resort.find(params[:id])
  end

  def new
  end

  def create
    Resort.create(resort_params)
    redirect_to '/resorts'
  end

  def edit
    @resort_id = params[:id]
  end

  def update
    resort = Resort.find(params[:id])
    resort.update(resort_params)
    redirect_to "/resorts/#{resort.id}"
  end

  private
    def resort_params
      params.permit(:name, :location, :is_open, :base_elevation, :summit_elevation)
    end
end
