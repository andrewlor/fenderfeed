class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  def create
    @post = Post.find(params[:post_id])
    comment = params[:comment]
    comment = @post.comments.create(comment: comment, user_id: current_user.id)
    redirect_to @post
  end
end