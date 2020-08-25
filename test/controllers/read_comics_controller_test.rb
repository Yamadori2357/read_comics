require 'test_helper'

class ReadComicsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get read_comics_home_url
    assert_response :success
    assert_select "title", "Home / Read comics"
  end
end
