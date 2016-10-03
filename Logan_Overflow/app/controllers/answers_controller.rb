class AnswersController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.new(answer_params)
    @answer.post_id = params[:post_id]
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to post_path(@post)
    else
      render post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
    @answer.destroy

    redirect_to post_path(@post)
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
