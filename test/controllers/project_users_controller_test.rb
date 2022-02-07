require "test_helper"

class ProjectUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_users_index_url
    assert_response :success
  end
end
