require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get Pages" do
    get static_Pages_url
    assert_response :success
  end

  test "should get home" do
    get static_home_url
    assert_response :success
    assert_select "title", "Home"
  end

  test "should get help" do
    get static_help_url
    assert_response :success
    assert_select "title", "Help"
  end

  test "should get about" do
    get static_about_url
    assert_response :success
    assert_select "title", "About"
  end
end
