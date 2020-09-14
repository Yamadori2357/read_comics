require 'test_helper'

class ComicsSearchTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "index including pagination" do
    log_in_as(@user)
    get search_comics_path
    assert_template 'comics/search_comics'
    assert_select 'div.pagination'
    Comic.paginate(page: 1).each do |comic|
      assert_select 'a[href=?]', comic_path(comic)
    end
  end
end
