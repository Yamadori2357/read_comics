require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  test "should redirect profile_edit when not logged in" do
    get profile_edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect profile_update when not logged in" do
    patch profile_edit_user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect password_edit when not logged in" do
    get password_edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect password_update when not logged in" do
    patch password_edit_user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect profile_edit when logged in as wrong user" do
    log_in_as(@other_user)
    get profile_edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect profile_update when logged in as wrong user" do
    log_in_as(@other_user)
    patch profile_edit_user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect password_edit when logged in as wrong user" do
    log_in_as(@other_user)
    get password_edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect password_update when logged in as wrong user" do
    log_in_as(@other_user)
    patch password_edit_user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end