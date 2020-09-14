require 'test_helper'

class ComicTest < ActiveSupport::TestCase
  def setup
    @comic = Comic.new(title: "ドラゴンボール", 
                       author_name: "鳥山明",
                       content: "山奥に住む怪力で、メチャクチャ元気な孫悟空。ある日悟空は、七つ揃うとどんな願いも叶うという、ドラゴンボールを探すブルマに出会う。彼女とともに、悟空もハラハラドキドキの旅へ出発する！",
                       genre: "少年漫画")
  end

  test "should be valid" do
    assert @comic.valid?
  end
  
  test "title should be present" do
    @comic.title = "     "
    assert_not @comic.valid?
  end
  
  test "author_name should be present" do
    @comic.author_name = "     "
    assert_not @comic.valid?
  end
  
  test "content should be present" do
    @comic.content = "     "
    assert_not @comic.valid?
  end
  
  test "genre should be present" do
    @comic.genre = "     "
    assert_not @comic.valid?
  end
  
  test "title addresses should be unique" do
    duplicate_comic = @comic.dup
    @comic.save
    assert_not duplicate_comic.valid?
  end
end
