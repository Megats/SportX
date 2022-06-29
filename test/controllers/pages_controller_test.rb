require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get pages_homepage_url
    assert_response :success
  end

  test "should get about_us" do
    get pages_about_us_url
    assert_response :success
  end
end
