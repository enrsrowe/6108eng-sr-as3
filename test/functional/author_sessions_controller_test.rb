require 'test_helper'

class AuthorSessionsControllerTest < ActionController::TestCase
  test "should get controller" do
    get :controller
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
