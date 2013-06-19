class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to posts_path, notice: "You are registered."
    else
      @user.errors.delete(:password_digest)
      render :new
    end
  end

  def edit
  end

  def update # TODO: fix this
    if @user.update_attributes(params[:user])
      redirect_to posts_path, notice: "Profile updated."
    else
      render :edit
    end
  end

end