require "test_helper"

class User::DreamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_dreams_index_url
    assert_response :success
  end

  test "should get show" do
    get user_dreams_show_url
    assert_response :success
  end
end
