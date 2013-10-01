require 'test_helper'

class LandmarkControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get within" do
    get :within
    assert_response :success
  end

end
