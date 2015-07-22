class LikesController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  def create
    post = Post.find(params[:post_id])
    if post.likes.find_by(user_id: current_user.id)

    else
      post.likes.create(user_id: current_user.id)
    end
    redirect_to params[:redirect]
  end
end
