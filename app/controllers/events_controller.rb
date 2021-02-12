class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    
    render json: @events
  end

  # # GET /events/1
  # def show
  #   render json: @event
  # end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.save



    if @event[:name] != nil && @event[:event_type] != nil
      if @event[:event_type] != "click" || @event[:event_type] != "view" || @event[:event_type] != "edit"
        @event.errors.add(:event_type, "#{@event.event_type} is not a valid event type")
        render json: @event.errors, status: :unprocessable_entity
      else 
        render json: @event, status: :created, location: @event
      end
    else
      if @event[:event_type] == nil
        @event.errors.add(:event_type, "must be given")
      else
      end
      if @event[:name] == nil
        @event.errors.add(:name, "must be given")
      else
      end
      render json: @event.errors, status: :unprocessable_entity
    end
  end

#   # PATCH/PUT /events/1
#   def update
#     if @event.update(event_params)
#       render json: @event
#     else
#       render json: @event.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /events/1
#   def destroy
#     @event.destroy
#   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :event_type, :at, :button_color)
    end
end
