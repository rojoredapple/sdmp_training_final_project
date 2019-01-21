require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attendees_new_url
    assert_response :success
  end

end
