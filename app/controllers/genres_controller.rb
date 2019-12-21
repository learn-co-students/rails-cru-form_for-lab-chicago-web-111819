class GenresController < ApplicationController

    def index
    end

    def new
        @genre = Genre.new
    end

    def create
        genre = Genre.create(allowed_params)
        redirect_to(genre_path(genre))
    end

    def edit
        @genre = find_item
    end

    def update
        genre = find_item
        genre.update_attributes(allowed_params)
        redirect_to(genre_path(genre))
    end

    def show
        @genre = find_item
    end

    private
        def find_item
            Genre.find_by(id: params[:id])
        end

        def allowed_params
            params.require(:genre).permit(:name)
        end
end
