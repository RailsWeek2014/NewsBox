class CommentsController < ApplicationController
 
  def new
  	@comment = Comment.new
  end

  def create feedentry
  	@comment = Comment.new(comments_param)

  	if @comment.save
  		redirect_to newsmessages_path
  	end
  end
end
