class UsersController < ApplicationController
  before_filter :find_user, only: [:edit, :update, :show]
  before_filter :current_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      # Set the user in session then redirect.
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "You are registered."
    else
      @user.errors.delete(:password_digest)
      render :new
    end
  end

  def edit
  end

  def show
    # binding.pry
    @post = find_user
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
    @user = User.find_by_slug(params[:id])
  end

end