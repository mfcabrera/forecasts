require 'test_helper'

class ForecastPointsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forecast_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forecast_point" do
    assert_difference('ForecastPoint.count') do
      post :create, :forecast_point => { }
    end

    assert_redirected_to forecast_point_path(assigns(:forecast_point))
  end

  test "should show forecast_point" do
    get :show, :id => forecast_points(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => forecast_points(:one).to_param
    assert_response :success
  end

  test "should update forecast_point" do
    put :update, :id => forecast_points(:one).to_param, :forecast_point => { }
    assert_redirected_to forecast_point_path(assigns(:forecast_point))
  end

  test "should destroy forecast_point" do
    assert_difference('ForecastPoint.count', -1) do
      delete :destroy, :id => forecast_points(:one).to_param
    end

    assert_redirected_to forecast_points_path
  end
end
