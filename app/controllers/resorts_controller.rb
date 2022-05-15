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
    resort = Resort.new ({
      name: params[:resort][:name],
      location: params[:resort][:location],
      is_open: params[:resort][:is_open],
      base_elevation: params[:resort][:base_elevation],
      summit_elevation: params[:resort][:summit_elevation]
      })
      resort.save
      redirect_to '/resorts'
  end
end
