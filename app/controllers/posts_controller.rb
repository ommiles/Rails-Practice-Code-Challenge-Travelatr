class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
            # redirect_to post_path(@post)
            # both work
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post  = Post.find(params[:id])
        if @post.update
            redirect_to @post
        else
            redirect_to edit_post_path(@post)
        end
    end

    # def like_post
    #     post = Post.find(params[:post_id])
    #     post.likes += 1
    #     post.save

    #     redirect_to post_path(post)
    # end

    def like
        @liked_post = Post.find(params[:id]).increase_likes
        @liked_post.save

        redirect_to post_path(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end