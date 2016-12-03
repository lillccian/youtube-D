class SongsController < ApplicationController

	before_action :set_song, :only=> [:show, :edit, :update]

	def index
		@songs = Song.all 
	end
	
	def show 
	end
	
	def edit 
	end
	
	def update
		if @song.update(song_params)
			redirect_to songs_path
		else
			render :action => :edit
		end
	end

	private

	def set_song
		@song = Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:name, :link, :description)
	end
end
