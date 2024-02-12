require "test_helper"

class ScansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scans_index_url
    assert_response :success
  end
end
