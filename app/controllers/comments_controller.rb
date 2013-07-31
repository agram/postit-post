class CommentsController < ApplicationController
  before_filter :require_user
  

  # POST /posts/:post_id/comments
  def create
    @post = Post.find_by_slug(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    # Above @comment is equivalent to below code snippets
    # @comment = Comment.new(params[:comment])
    # @post.comments << @comment

    @comment.user = current_user 

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added."
    else
      @comments = @post.comments.reload
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        flash[:notice] = "Your vote was counted."
        redirect_to :back
      end

      format.js
    end
  end

end