class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @user = current_user.id
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def delete
  end

    private
    def comment_params
      params.require(:comment).permit(:body).merge(:user_id=>@user)
    end
end
