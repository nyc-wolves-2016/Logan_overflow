class AnswersController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find
  end
end
