require 'test_helper'

class PasswordEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful password_edit" do
    log_in_as(@user)
    get password_edit_user_path(@user)
    assert_template 'users/password_edit'
    patch password_edit_user_path(@user), params: { user: { password:              "foo",
                                                            password_confirmation: "bar" } }

    assert_template 'users/password_edit'
  end
  
  test "successful password_edit with friendly forwarding" do
    get password_edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to password_edit_user_url(@user)
    patch password_edit_user_path(@user), params: { user: { password: "a" * 6,
                                                            password_confirmation: "a" * 6 } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
  end
end