class ApplicationController < ActionController::Base
  before_action :ranking_comic
  include SessionsHelper

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    def ranking_comic
      @ranking_comic = Comic.find(Bookmark.group(:comic_id).order('count(comic_id) desc').limit(10).pluck(:comic_id))
    end
end