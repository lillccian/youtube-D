class YtlinksController < ApplicationController

	before_action :set_song

	def index
		@ytlinks = @song.ytlinks
	end

	def show 
		@ytlink = @song.ytlinks.find(params[:id])
	end

	private

	def set_song
		@song = Song.find(params[:song_id])
	end

end
