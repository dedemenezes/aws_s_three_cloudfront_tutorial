class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy edit update]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post created 🚀'
    else
      flash[:alert] = 'Post not created 😔'
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice:  }
      format.turbo_stream
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post updated!'}
      format.turbo_stream { render turbo_stream: turbo_stream.update(@post) }
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post removed 🚮' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
