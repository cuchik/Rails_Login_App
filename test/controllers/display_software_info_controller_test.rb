require 'test_helper'

class DisplaySoftwareInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get display_info" do
    get login_path
    assert_response :success
  end

end
