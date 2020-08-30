class UsersController < ApplicationController
  before_action :logged_in_user, only: [:profile_edit, :profile_update, :password_edit, :password_update]
  before_action :correct_user, only: [:profile_edit, :profile_update, :password_edit, :password_update]
  

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # GET /user/:id/profile_edit
  def profile_edit
    @user = User.find(params[:id])
  end
 # => app/views/users/profile_edit.html.erb
 
  def profile_update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'profile_edit'
    end
  end
  
  # GET /user/:id/password_edit
  def password_edit
    @user = User.find(params[:id])
  end
 # => app/views/users/password_edit.html.erb
 
  def password_update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "password updated"
      redirect_to @user
    else
      render 'password_edit'
    end
  end
  
  
  def search_users
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  

 
  private

    def user_params
      params.require(:user).permit(:name, :email, :self_instoduction, :password,
                                   :password_confirmation)
    end
    
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end