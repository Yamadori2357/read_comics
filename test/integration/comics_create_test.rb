require 'test_helper'

class CreateCreateTest < ActionDispatch::IntegrationTest

  test "invalid comic_create information" do
    get new_comic_path
    assert_no_difference 'Comic.count' do
      post comics_path, params: { comic: { title:  "",
                                         author_name: "",
                                         genre:              "foo",
                                         content: "bar" } }
    end
    assert_template 'comics/new'
  end
end
