class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end


    def show
        @blogger = Blogger.find(params[:id])
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio) 
    end
end