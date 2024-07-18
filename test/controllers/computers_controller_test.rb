require "test_helper"

class ComputersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get computers_index_url
    assert_response :success
  end

  test "should get show" do
    get computers_show_url
    assert_response :success
  end

  test "should get new" do
    get computers_new_url
    assert_response :success
  end

  test "should get edit" do
    get computers_edit_url
    assert_response :success
  end
end
