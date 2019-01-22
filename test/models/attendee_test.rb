require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase

  def setup
    @event = events(:one)
    @attendee = @event.attendees.build(email: "attendee@example.com")
  end

  test "should be valid" do
    assert @attendee.valid?
  end

  test "event id should be present" do
    @attendee.event_id = nil
    assert_not @attendee.valid?
  end

  test "email should be present" do
    @attendee.email = " "
    assert_not @attendee.valid?
  end

  test "email should not be too long" do
    @attendee.email = "m" * 244 + "@example.com"
    assert_not @attendee.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[attendee@example.com ATTENDEE@foo.COM A_TT-EN.DEE@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @attendee.email = valid_address
      assert @attendee.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[attendee@example,com attendee_at_foo.org attendee.email@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @attendee.email = invalid_address
      assert_not @attendee.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @attendee.email = mixed_case_email
    @attendee.save
    assert_equal mixed_case_email.downcase, @attendee.reload.email
  end

  test "order should be most recent first" do
    assert_equal attendees(:most_recent), Attendee.first
  end
end
