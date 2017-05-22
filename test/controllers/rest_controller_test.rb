require 'test_helper'

class RestControllerTest < ActionDispatch::IntegrationTest
  test "should get verify_user" do
    get rest_verify_user_url
    assert_response :success
  end

end
