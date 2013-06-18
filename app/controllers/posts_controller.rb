class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update]

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

    @post.user_id = 4

    if @post.save
      flash[:notice] = 'Post added successfully.'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
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

end
