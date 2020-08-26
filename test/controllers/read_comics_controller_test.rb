require 'test_helper'

class ReadComicsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "ホーム / Read comics"
  end
end
