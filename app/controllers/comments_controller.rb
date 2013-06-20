# post_comments GET  /posts/:post_id/comments(.:format)          comments#index
#                   POST /posts/:post_id/comments(.:format)          comments#create
#  new_post_comment GET  /posts/:post_id/comments/new(.:format)      comments#new
# edit_post_comment GET  /posts/:post_id/comments/:id/edit(.:format) comments#edit
#      post_comment GET  /posts/:post_id/comments/:id(.:format)      comments#show
#                   PUT  /posts/:post_id/comments/:id(.:format)      comments#update

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

end