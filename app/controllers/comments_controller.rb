class CommentsController < ApplicationController
 
  def new 
  	@entry = FeedEntry.find(params[:feed_entry_id])
  	@comment = Comment.new
  	@comment.feed_entry = @entry
  end

  def create
  	@comment = Comment.new(comments_params)


  	if @comment.save
  		redirect_to feed_entries_path, 
      notice: "Comment wurde erfolgreich erstellt."
  	end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to listeners_path, 
    notice: "Comment wurde erfolgreich gelöscht."
  end

  private
	def comments_params
		params.require('comment').permit('comment','feed_entry_id')
	end
end
