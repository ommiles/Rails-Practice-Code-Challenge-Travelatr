class BloggersController < ApplicationController

    def new
        @blogger = Blogger.new
    end

    def show
        @blogger = Blogger.find(params[:id])
    end
end