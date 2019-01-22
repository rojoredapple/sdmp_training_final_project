class AttendeesController < ApplicationController

  def index
    @attendees = Attendee.all
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.create(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to event_attendees_path, notice: "Check in was successful." }
      else
        format.html { render :new }
      end
    end
  end

  private

    def attendee_params
      params.require(:attendee).permit(:email, :event_id)
    end
end
