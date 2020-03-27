class PerformancesController < ApplicationController
  before_action :set_performance, only: [:destroy, :show]

  # GET /performances
  def index
    @performances = Performance.all

    render json: @performances
  end


  # POST /performances
  def create
    @performance = Performance.new(performance_params)

    if @performance.save
      render json: @performance, status: :created, location: @performance
    else
      render json: @performance.errors, status: :unprocessable_entity
    end
  end

  def show

  end

  # DELETE /performances/1
  def destroy
    @performance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performance
      @performance = Performance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def performance_params
      get_params = params.require(:performance).permit(:name, duration: [:start_date, :end_date])
      get_params[:duration] = get_params[:duration][:start_date].to_date..get_params[:duration][:end_date].to_date
      get_params
    end
end
