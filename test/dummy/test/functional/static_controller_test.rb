require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get container" do
    get :container
    assert_response :success
  end

  test "should get iframe" do
    get :iframe
    assert_response :success
  end

end
