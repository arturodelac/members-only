class PostsController < ApplicationController
    before_action :authenticate_user!,except: [:index,:show]

    def index
        @posts= Post.all.order("created_at DESC")
    end
    def new
      @post = current_user.posts.build

    end
    def create
      @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
    end
    def show
      @post = Post.find(params[:id])
    end

    def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post was successfully destroyed."
      
    end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title,:body)
    end
end