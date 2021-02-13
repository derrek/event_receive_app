require 'set'
class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :update, :destroy]

  # GET /stats
  def index

    s = Set["click", "view", "edit"]
    @events = Event.all
    @stats = @events.select{|e| e.created_at.to_date == Date.current.to_date}.group_by{|d| d[:event_type]}.select{|k, v| k.in? s}
    @stats.update(@stats) {|key, value| value.count}

    render json: @stats
  end

  # GET /stats/1
  def show
    render json: @stat
  end

  # POST /stats
  def create
    @stat = Stat.new(stat_params)

    if @stat.save
      render json: @stat, status: :created, location: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stats/1
  def update
    if @stat.update(stat_params)
      render json: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stats/1
  def destroy
    @stat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stat_params
      params.require(:stat).permit(:click, :view, :edit)
    end
end
