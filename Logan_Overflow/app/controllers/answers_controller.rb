class AnswersController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params)
  end

  
end
