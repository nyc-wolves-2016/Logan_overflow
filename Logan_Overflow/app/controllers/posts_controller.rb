class PostsController < ApplicationController
  def index
  end

  def recent
    posts = Post.all.ordered_json
    render json: posts
  end

  def show
    @post = Post.find(params[:id]).convert_json
  end

  def display
  end



  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
