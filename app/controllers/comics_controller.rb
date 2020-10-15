class ComicsController < ApplicationController
   before_action :logged_in_user, only: [:search_comics]
  
  def show
    @comic = Comic.find(params[:id])
    @review = Review.new
    @reviews = @comic.reviews
  end
  
  def new
    @comic = Comic.new
  end
  
  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to @comic
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end
  
  def search_comics
    if params[:title].present?
      @comics = Comic.where('title LIKE ?', "%#{params[:title]}%").paginate(page: params[:page])
    else
      @comics = Comic.paginate(page: params[:page])
    end
  end
  
  def favorited_ranks
    @title = "お気に入りランキング"
    @count_name = "お気に入り"
    @comics = Comic.find(Bookmark.group(:comic_id).order('count(comic_id) desc').limit(10).pluck(:comic_id))
    render 'comics/comic_ranks'
  end
  
  
  private

    def comic_params
      params.require(:comic).permit(:title, :genre, :author_name, :content, :cover_image)
    end
    
end
