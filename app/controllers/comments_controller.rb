class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_post,  :set_comment, :only =>[:edit, :update, :destroy]#except: [:create]
  layout 'comment_layout' #this will check for flash alerts

  def create
    @post=Post.find(params[:post_id])
    @comment= @post.comments.new(comment_params)
    if @comment.save #if this returns not nill values, then it is success
      flash.notice = "The comment was created successfully."
      redirect_to @post
    else
      flash.notice = "The comment was not created ."
      flash.now.alert = @comment.errors.full_messages.to_sentence
      redirect_to posts_path
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy # I may need to destroy this from Post.comment.destroy
    @comment.destroy
    redirect_to @post
  end


  def  set_post
      @post=Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def catch_not_found(e)
    Rails.logger.debug("We had a not found exception.")
    flash.alert = e.to_s
    redirect_to posts_path
  end
end
