class AnswersController < ApplicationController
  def edit
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
  end

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

  def update
    @post = Post.find(params[:post_id])
    answer = Answer.find(params[:id])
    if answer.update(answer_params)
      redirect_to @post
    else
      render 'edit'
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
