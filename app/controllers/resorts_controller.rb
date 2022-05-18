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
    new_resort = Resort.create(resort_params)
    new_resort.save
    redirect_to '/resorts'
  end

  def edit
    @resort = Resort.find(params[:id])
  end

  def update
    resort = Resort.find(params[:id])
    resort.update(resort_params)
    resort.save
    redirect_to "/resorts/#{params[:id]}"
  end

  def destroy
    resort = Resort.find(params[:id])
    resort.runs.destroy_all
    resort.destroy
    redirect_to "/resorts"
  end

  private
    def resort_params
      params.permit(:name, :location, :is_open, :base_elevation, :summit_elevation)
    end
end
