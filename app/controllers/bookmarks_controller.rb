class BookmarksController < ApplicationController
  def create
    @comic = Comic.find(params[:comic_id])
    unless @comic.favorite?(current_user)
      @comic.favorite(current_user)
      @comic.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @comic = Bookmark.find(params[:id]).comic
    if @comic.favorite?(current_user)
      @comic.unfavorite(current_user)
      @comic.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
