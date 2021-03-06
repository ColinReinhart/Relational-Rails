class RunsController < ApplicationController
  def index
    @runs = Run.is_open
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

  def destroy
    run = Run.find(params[:id])
    run.destroy
    redirect_to "/runs"
  end

    private
      def run_params
        params.permit(:name, :is_open, :has_moguls, :above_timberline, :difficulty, :vertical_feet)
      end
end
