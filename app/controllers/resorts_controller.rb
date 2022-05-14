class ResortsController < ApplicationController
  def index
    @resorts = Resort.order_by_created_time
  end

  def show
    @resort = Resort.find(params[:id])
  end
end
