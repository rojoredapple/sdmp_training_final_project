class AttendeesController < ApplicationController

  def index
    @attendees = Attendee.all
  end

  def show
  end

  def new
    @attendee = Attendee.new
  end

  def edit
  end

  def create
    @attendee = Attendee.create(attendee_params)
  end

  def update
  end

  def destroy
  end

  private

    def attendee_params
      params.require(:attendee).permit(:email, :event_id, :created_at)
    end
end
