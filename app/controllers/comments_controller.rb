# post_comments GET  /posts/:post_id/comments(.:format)          comments#index
#                   POST /posts/:post_id/comments(.:format)          comments#create
#  new_post_comment GET  /posts/:post_id/comments/new(.:format)      comments#new
# edit_post_comment GET  /posts/:post_id/comments/:id/edit(.:format) comments#edit
#      post_comment GET  /posts/:post_id/comments/:id(.:format)      comments#show
#                   PUT  /posts/:post_id/comments/:id(.:format)      comments#update

class CommentsController < ApplicationController

  # POST /posts/:post_id/comments
  def create
    # binding.pry
    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])
    @post.comments << @comment

    @comment.user_id = 4

    if @comment.save
      flash[:notice] = 'Success! Comment added.'
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
  
end