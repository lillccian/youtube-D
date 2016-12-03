class YtlinksController < ApplicationController

	before_action :set_song

	def index
		@ytlinks = @song.ytlinks
	end


	private

	def set_song
		@song = Song.find(params[:song_id])
	end

end
