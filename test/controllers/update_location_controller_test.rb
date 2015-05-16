require 'test_helper'

class UpdateLocationControllerTest < ActionController::TestCase
  test "should get current" do
    get :current
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
