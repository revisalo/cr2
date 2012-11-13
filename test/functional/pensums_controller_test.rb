require 'test_helper'

class PensumsControllerTest < ActionController::TestCase
  setup do
    @pensum = pensums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pensums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pensum" do
    assert_difference('Pensum.count') do
      post :create, pensum: { magister_id: @pensum.magister_id, semester: @pensum.semester, year: @pensum.year }
    end

    assert_redirected_to pensum_path(assigns(:pensum))
  end

  test "should show pensum" do
    get :show, id: @pensum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pensum
    assert_response :success
  end

  test "should update pensum" do
    put :update, id: @pensum, pensum: { magister_id: @pensum.magister_id, semester: @pensum.semester, year: @pensum.year }
    assert_redirected_to pensum_path(assigns(:pensum))
  end

  test "should destroy pensum" do
    assert_difference('Pensum.count', -1) do
      delete :destroy, id: @pensum
    end

    assert_redirected_to pensums_path
  end
end
