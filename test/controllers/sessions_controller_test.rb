require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@base_title = "ENT Software Center"
	end
  test "should get root" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    get login_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

end
