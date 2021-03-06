require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @comic = comics(:naruto)
  end
  
  test "should get comic_show" do
    get comic_path(@comic)
    assert_response :success
  end
  
  test "should redirect index when not logged in" do
    get search_comics_path
    assert_redirected_to login_url
  end

end
