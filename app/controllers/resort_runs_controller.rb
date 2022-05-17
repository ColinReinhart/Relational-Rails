class ResortRunsController < ApplicationController
  def index
    @resort = Resort.find(params[:resort_id])
    @runs = @resort.runs
  end

  def new
    @resort = Resort.find(params[:id])
  end

  def create
    resort = Resort.find(params[:id])
    new_run = resort.runs.create(run_params)
    new_run.save
    redirect_to "/resorts/#{resort.id}/runs"
  end

  private
    def run_params
      params.permit(:name, :is_open, :has_moguls, :above_timberline, :difficulty, :vertical_feet)
    end
end
