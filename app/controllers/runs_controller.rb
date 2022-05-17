class RunsController < ApplicationController
  def index
    @runs = Run.all
  end

  def show
    @run = Run.find(params[:id])
  end

  def edit
    @run = Run.find(params[:id])
  end

  def update
    run = Run.find(params[:id])
    run.update(run_params)
    run.save
    redirect_to "/runs/#{params[:id]}"
  end

    private
      def run_params
        params.permit(:name, :is_open, :has_moguls, :above_timberline, :difficulty, :vertical_feet)
      end
end
