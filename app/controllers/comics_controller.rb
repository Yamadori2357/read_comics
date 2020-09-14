class ComicsController < ApplicationController
   before_action :logged_in_user, only: [:search_comics]
  
  def show
    @comic = Comic.find(params[:id])
  end
  
  def search_comics
    if params[:title].present?
      @comics = Comic.where('title LIKE ?', "%#{params[:title]}%").paginate(page: params[:page])
    else
      @comics = Comic.paginate(page: params[:page])
    end
  end
  
  private

    def comic_params
      params.require(:comic).permit(:title, :genre, :author_name)
    end
    
end
