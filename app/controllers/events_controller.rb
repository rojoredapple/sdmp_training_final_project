class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @attendee = Attendee.new
  end

  def edit
  end

  def create
    @event = Event.create(event_params)
  end

  def update
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time)
    end
end
