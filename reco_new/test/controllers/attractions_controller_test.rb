require 'test_helper'

class AttractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attraction = attractions(:one)
  end

  test "should get index" do
    get attractions_url
    assert_response :success
  end

  test "should get new" do
    get new_attraction_url
    assert_response :success
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post attractions_url, params: { attraction: { description: @attraction.description, name: @attraction.name } }
    end

    assert_redirected_to attraction_url(Attraction.last)
  end

  test "should show attraction" do
    get attraction_url(@attraction)
    assert_response :success
  end

  test "should get edit" do
    get edit_attraction_url(@attraction)
    assert_response :success
  end

  test "should update attraction" do
    patch attraction_url(@attraction), params: { attraction: { description: @attraction.description, name: @attraction.name } }
    assert_redirected_to attraction_url(@attraction)
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete attraction_url(@attraction)
    end

    assert_redirected_to attractions_url
  end
end
