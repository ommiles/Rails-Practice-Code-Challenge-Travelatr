class BloggersController < ApplicationController

    def new
        @blogger = Blogger.new
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio) 
    end
end