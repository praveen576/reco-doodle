require 'test_helper'

class RoleusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roleuser = roleusers(:one)
  end

  test "should get index" do
    get roleusers_url
    assert_response :success
  end

  test "should get new" do
    get new_roleuser_url
    assert_response :success
  end

  test "should create roleuser" do
    assert_difference('Roleuser.count') do
      post roleusers_url, params: { roleuser: {  } }
    end

    assert_redirected_to roleuser_url(Roleuser.last)
  end

  test "should show roleuser" do
    get roleuser_url(@roleuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_roleuser_url(@roleuser)
    assert_response :success
  end

  test "should update roleuser" do
    patch roleuser_url(@roleuser), params: { roleuser: {  } }
    assert_redirected_to roleuser_url(@roleuser)
  end

  test "should destroy roleuser" do
    assert_difference('Roleuser.count', -1) do
      delete roleuser_url(@roleuser)
    end

    assert_redirected_to roleusers_url
  end
end
