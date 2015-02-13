require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index88" do
    get :index88
    assert_response :success
  end

end
