class PostsController < ApplicationController

    before_action :find_post, only: [:show, :update, :destroy]

    def index
        @posts = Post.all
    end

    def show
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
            # redirect_to post_path(@post)
            # both work
        else
            flash[:my_errors] = @post.errors.full_messages 
            redirect_to new_post_path
            # render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        @post  = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
        else
            flash[:my_errors] = @post.errors.full_messages 
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

    def unlike
        @liked_post = Post.find(params[:id]).decrease_likes
        @liked_post.save

        redirect_to post_path(params[:id])
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end