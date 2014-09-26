require 'test_helper'

class CalendarControllerTest < ActionController::TestCase
  test "should get calendar_view" do
    get :calendar_view
    assert_response :success
  end

end
