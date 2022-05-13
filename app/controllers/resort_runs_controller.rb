class ResortRunsController < ApplicationController
  def index
    @resort = Resort.find(params[:resort_id])
    @runs = @resort.runs
  end
end
