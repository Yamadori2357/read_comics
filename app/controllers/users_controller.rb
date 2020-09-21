class UsersController < ApplicationController
  before_action :logged_in_user, only: [:profile_edit, :profile_update, :password_edit, :password_update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:profile_edit, :profile_update, :password_edit, :password_update]
  before_action :admin_user,     only:  :destroy
  


  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールをご確認ください"
      redirect_to root_url
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
      @users = User.where('name LIKE ?', "%#{params[:name]}%").paginate(page: params[:page])
    else
      @users = User.paginate(page: params[:page])
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

 
  private

    def user_params
      params.require(:user).permit(:name, :unique_name, :email, :self_instoduction, :profile_image, :header_image,
      :password,:password_confirmation, :gender)
    end
    
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
  
end