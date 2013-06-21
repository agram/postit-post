class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update]
  before_filter :require_user, only: [:new, :create, :update, :edit]
  before_filter :current_user, only: [:index, :edit, :update] # For conditionally displaying 'edit' link and restricting action
  before_filter :require_same_user, only: [:edit, :update]

  def index # Done
    @post = Post.all
  end

  def show # Done
    @comment = Comment.new
    # binding.pry
  end

  def new # Done
    @post = Post.new
  end

  def create # Done
    @post= Post.new(params[:post])
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post added successfully.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update # Done
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post updated successfully.'
      redirect_to post_path
    else
      render :edit
    end
  end

  def find_post
    @post= Post.find(params[:id])
  end

  def require_same_user
    if current_user != find_post.user
      flash[:error] = "You cannot perform this action."
      redirect_to posts_path
    end
  end

end
