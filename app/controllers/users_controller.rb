class UsersController < ApplicationController
  before_filter :find_user, only: [:edit, :update]

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

  def update
    if @user.update_attributes(params[:user])
      redirect_to posts_path, notice: "Profile updated."
    else
      @user.errors.delete(:password_digest)
      render :edit
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

end