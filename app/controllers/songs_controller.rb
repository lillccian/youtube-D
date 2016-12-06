class SongsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	before_action :set_song, :only => [:show, :edit, :update, :destroy]

	def index
		@song = Song.new
		if params[:keyword]
	    @tags = Tag.where( [ "tag like ?", "%#{params[:keyword]}%" ] )
	  else
			@songs = Song.all 
	  end

	end
	
	def show 
		@song.view!
		@tag = @song.tags.new
		@tags = @song.tags.all
		@ytlinks = @song.ytlinks.all
		@ytlink = @song.ytlinks.new
		@comments = @song.comments.all
		@comment = @song.comments.new
  	@keep = current_user.keeps.find_by_song_id(@song)
  	@like = current_user.likes.find_by_song_id(@song)
	end
	
	def edit 
		if params[:order]
			@id = @song.id
			respond_to do |format|
				format.js
			end
		else 
			respond_to do |format|
				format.js
			end
		end
	end
	
	def update
		if @song.update(song_params)
			@tags = @song.tags.all
			respond_to do |format|
				format.js
			end
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
