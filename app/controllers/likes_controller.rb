class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_song

	def create
		@like = Like.new(:user=>current_user,:song=>@song)
		@like.save
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@like.destroy
		@like = nil
		respond_to do |format|
			format.js
		end
	end

	private
	def find_song
		@song = Song.find(params[:song_id])
	end
	
end
