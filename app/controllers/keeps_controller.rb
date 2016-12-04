class KeepsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_song

	def create
		@keep = Keep.new(:user=>current_user,:song=>@song)
		@keep.save
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@keep = Keep.find(params[:id])
		@keep.destroy
		@keep = nil
		respond_to do |format|
			format.js
		end
	end

	private
	
	def find_song
		@song = Song.find(params[:song_id])
	end
	
end
