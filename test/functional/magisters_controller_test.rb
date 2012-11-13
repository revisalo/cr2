require 'test_helper'

class MagistersControllerTest < ActionController::TestCase
  setup do
    @magister = magisters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:magisters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create magister" do
    assert_difference('Magister.count') do
      post :create, magister: { code: @magister.code }
    end

    assert_redirected_to magister_path(assigns(:magister))
  end

  test "should show magister" do
    get :show, id: @magister
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @magister
    assert_response :success
  end

  test "should update magister" do
    put :update, id: @magister, magister: { code: @magister.code }
    assert_redirected_to magister_path(assigns(:magister))
  end

  test "should destroy magister" do
    assert_difference('Magister.count', -1) do
      delete :destroy, id: @magister
    end

    assert_redirected_to magisters_path
  end
end
