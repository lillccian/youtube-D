class TagsController < ApplicationController

	before_action :set_song 

	def new 
		@tag = @song.tags.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@tag = @song.tags.new(tag_params)
		if @tag.save
			@tag = @song.tags.new
			@tags = @song.tags.all
			respond_to do |format|
				format.js
			end
		else
			render :new
		end
	end

	def destroy
		@tag = @song.tags.find(params[:id])
		@tag.destroy
		@tags = @song.tags.all
		respond_to do |format|
			format.js
		end
	end
	private

	def set_song
		@song = Song.find(params[:song_id])
	end
	def tag_params
		params.require(:tag).permit(:tag)
	end

end
