class PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  def new
  end

  def index
    @posts = Post.all.limit(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    title = params[:title]
    content = params[:content]
    pathToFile = params[:pathToFile]
    category = params[:category].to_i
    if title.nil? || pathToFile.nil? || category == 0
      session[:error_newpost] = "Please fill required fields."
      redirect_to "/posts/new"
    else
      @post = current_user.posts.create(title: title, content: content, pathToFile: pathToFile, category_id: category)
      @post.save
      session[:error_newpost] = nil
      redirect_to @post
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
