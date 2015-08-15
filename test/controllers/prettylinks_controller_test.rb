require 'test_helper'

class PrettylinksControllerTest < ActionController::TestCase
  setup do
    @prettylink = prettylinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prettylinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prettylink" do
    assert_difference('Prettylink.count') do
      post :create, prettylink: { image: @prettylink.image, title: @prettylink.title, url: @prettylink.url, user_id: @prettylink.user_id }
    end

    assert_redirected_to prettylink_path(assigns(:prettylink))
  end

  test "should show prettylink" do
    get :show, id: @prettylink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prettylink
    assert_response :success
  end

  test "should update prettylink" do
    patch :update, id: @prettylink, prettylink: { image: @prettylink.image, title: @prettylink.title, url: @prettylink.url, user_id: @prettylink.user_id }
    assert_redirected_to prettylink_path(assigns(:prettylink))
  end

  test "should destroy prettylink" do
    assert_difference('Prettylink.count', -1) do
      delete :destroy, id: @prettylink
    end

    assert_redirected_to prettylinks_path
  end
end
