require 'test_helper'

class ProfileEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful profile_edit" do
    log_in_as(@user)
    get profile_edit_user_path(@user)
    assert_template 'users/profile_edit'
    patch profile_edit_user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid", self_instoduction: "a" }}

    assert_template 'users/profile_edit'
  end
  
  test "successful profile_edit with friendly forwarding" do
    get profile_edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to profile_edit_user_url(@user)
    name  = "Foo Bar"
    email = "foo@bar.com"
    self_instoduction = "a"
    patch profile_edit_user_path(@user), params: { user: { name:  name,
                                                           email: email, self_instoduction: self_instoduction }}
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal self_instoduction, @user.self_instoduction
  end
end