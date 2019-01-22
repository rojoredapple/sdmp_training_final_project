require 'test_helper'

class EventsProfileTest < ActionDispatch::IntegrationTest

  include ApplicationHelper

  def setup
    @event = events(:one)
  end

  test "associated attendees should be destroyed" do
    @event.save
    @event.attendees.create!(email: "attendee@example.com")
    assert_difference 'Attendee.count', -1 do
      @event.destroy
    end
  end

  test "profile display" do
    get event_path(@event)
    assert_template 'events/show'
    assert_select 'title', full_title(@event.name)
    assert_select 'h1', text: @event.name
    assert_match @event.attendees.count.to_s, response.body
  end
end
