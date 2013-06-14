# post_comments GET  /posts/:post_id/comments(.:format)          comments#index
#                   POST /posts/:post_id/comments(.:format)          comments#create
#  new_post_comment GET  /posts/:post_id/comments/new(.:format)      comments#new
# edit_post_comment GET  /posts/:post_id/comments/:id/edit(.:format) comments#edit
#      post_comment GET  /posts/:post_id/comments/:id(.:format)      comments#show
#                   PUT  /posts/:post_id/comments/:id(.:format)      comments#update

class CommentsController < ApplicationController

  # GET /posts/:post_id/comments
  def index
    @comment = Comment.find(params[:post_id])
  end

  # GET /posts/:post_id/comments/:id
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /posts/:post_id/comments/new
  def new
    @comment = Comment.new
  end

  # POST /posts/:post_id/comments
  def create
    # binding.pry
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @post.comments << @comment

    @comment.user_id = 2

    if @comment.save
      flash[:notice] = 'Success! Comment added.'
      redirect_to post_path(@post)
    else
      render :index
    end
  end

  # GET /posts/:post_id/comments/:id/edit  
  def edit
    
  end

  # PUT /posts/:post_id/comments/:id
  def update
    
  end
end