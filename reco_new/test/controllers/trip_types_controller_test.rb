require 'test_helper'

class TripTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_type = trip_types(:one)
  end

  test "should get index" do
    get trip_types_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_type_url
    assert_response :success
  end

  test "should create trip_type" do
    assert_difference('TripType.count') do
      post trip_types_url, params: { trip_type: { name: @trip_type.name } }
    end

    assert_redirected_to trip_type_url(TripType.last)
  end

  test "should show trip_type" do
    get trip_type_url(@trip_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_type_url(@trip_type)
    assert_response :success
  end

  test "should update trip_type" do
    patch trip_type_url(@trip_type), params: { trip_type: { name: @trip_type.name } }
    assert_redirected_to trip_type_url(@trip_type)
  end

  test "should destroy trip_type" do
    assert_difference('TripType.count', -1) do
      delete trip_type_url(@trip_type)
    end

    assert_redirected_to trip_types_url
  end
end
