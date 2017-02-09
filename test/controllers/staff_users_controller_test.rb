require 'test_helper'

class StaffUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get staff_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get staff_users_edit_url
    assert_response :success
  end

  test "should get create" do
    get staff_users_create_url
    assert_response :success
  end

end
