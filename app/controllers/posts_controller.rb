class PostsController < ApplicationController

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
            redirect_to post_path(@post)??
        else
            render :new
        end
    end

    def update
        @post  = Post.find(params[:id])
        if @post.update
            redirect_to @post
        else
            redirect_to edit_post_path(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end