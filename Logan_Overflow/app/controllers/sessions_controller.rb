class SessionsController < ApplicationController
  def new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.find_by_email(params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

  # private
  #   def session_params
  #     params.require(:session).permit(:username, :email, :password)
  #   end
end
