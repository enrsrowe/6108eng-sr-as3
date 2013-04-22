require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get getstarted" do
    get :getstarted
    assert_response :success
  end

  test "should get whatson" do
    get :whatson
    assert_response :success
  end

  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get race" do
    get :race
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get joinus" do
    get :joinus
    assert_response :success
  end

  test "should get access" do
    get :access
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
