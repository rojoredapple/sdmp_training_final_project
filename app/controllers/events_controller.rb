class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: "Event was successfully created." }
      else
        format.html { render :new }
      end
    end

  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Event was successfully canceled." }
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, attendees_attributes: [:id, :email, :created_at ])
    end
end
