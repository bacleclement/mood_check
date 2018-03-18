require 'test_helper'

class ThoughtChecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get thought_checks_index_url
    assert_response :success
  end

  test "should get show" do
    get thought_checks_show_url
    assert_response :success
  end

  test "should get new" do
    get thought_checks_new_url
    assert_response :success
  end

  test "should get create" do
    get thought_checks_create_url
    assert_response :success
  end

  test "should get edit" do
    get thought_checks_edit_url
    assert_response :success
  end

  test "should get update" do
    get thought_checks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get thought_checks_destroy_url
    assert_response :success
  end

end
