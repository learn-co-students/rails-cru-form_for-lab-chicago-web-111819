class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        song = Song.create(allowed_params)
        redirect_to(song_path(song))
    end

    def edit
        @song = find_item
    end

    def update
        song = find_item
        song.update_attributes(allowed_params)
        redirect_to(song_path(song))
    end

    def show
        @song = find_item
    end

    private
        def find_item
            Song.find_by(id: params[:id])
        end

        def allowed_params
            params.require(:song).permit(:name, :artist_id, :genre_id)
        end
end
