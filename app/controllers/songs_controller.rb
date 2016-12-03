class SongsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	before_action :set_song, :only => [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all 
		@song = Song.new
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

	def destroy
		@song.destroy
		redirect_to songs_path
	end

	def new
		@song = current_user.songs.new
	end

	def create 
		@song = current_user.songs.new(song_params)
		if @song.save
			redirect_to songs_path
		else
			render :action => :new
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
