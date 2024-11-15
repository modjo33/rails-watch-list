class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to @bookmark.list, notice
  end
end

private

def bookmark_params
  params.require(:bookmark).permit(:movie_id, :comment)
end
