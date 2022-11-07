require "test_helper"

class User::ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_lists_show_url
    assert_response :success
  end
end
