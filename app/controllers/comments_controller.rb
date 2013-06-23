class CommentsController < ApplicationController
  before_filter :require_user
  

  # POST /posts/:post_id/comments
  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    # Above @comment is equivalent to below code snippets
    # @comment = Comment.new(params[:comment])
    # @post.comments << @comment

    @comment.user = current_user  # TODO: fix after authentication

    if @comment.save
      redirect_to post_path(@post), notice: "Your comment was added."
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    flash[:notice] = "Your vote was counted."
    redirect_to :back
  end

end