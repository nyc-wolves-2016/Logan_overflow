class UsersController < ApplicationController

  def profile
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end
  
end
