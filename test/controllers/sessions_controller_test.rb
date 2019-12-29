require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get googleAuth" do
    get sessions_googleAuth_url
    assert_response :success
  end

end
