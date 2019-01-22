require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = events(:one)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "name should be present" do
    @event.name = "  "
    assert_not @event.valid?
  end

  test "name should not be too long" do
    @event.name = "m" * 51
    assert_not @event.valid?
  end

  test "start_time should be present" do
    @event.start_time = " "
    assert_not @event.valid?
  end

  test "end_time should be present" do
    @event.end_time = " "
    assert_not @event.valid?
  end
end
