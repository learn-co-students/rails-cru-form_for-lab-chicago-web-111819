class ArtistsController < ApplicationController

    def index
    end

    def new
        @artist = Artist.new
    end

    def create
        artist = Artist.create(allowed_params)
        redirect_to(artist_path(artist))
    end

    def edit
        @artist = find_item
    end

    def update
        artist = find_item
        artist.update_attributes(allowed_params)
        redirect_to(artist_path(artist))
    end

    def show
        @artist = find_item
    end

    private
        def find_item
            Artist.find_by(id: params[:id])
        end

        def allowed_params
            params.require(:artist).permit(:name, :bio)
        end

end
