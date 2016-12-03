class YtlinksController < ApplicationController

	before_action :set_song
	before_action :set_ytlink, :only => [:show, :edit, :update, :destroy]

	def index
		@ytlinks = @song.ytlinks
	end

	def show 
	end

	def edit
	end

	def update
		if @ytlink.update(ytlink_params)
			redirect_to song_ytlinks_path(@song)
		else
			render :action => :edit
		end
	end

	def destroy
		@ytlink.destroy
		redirect_to song_ytlinks_path(@song)
	end

	def new
		@ytlink = @song.ytlinks.new
	end

	def create
		@ytlink = @song.ytlinks.new(ytlink_params)
		@ytlink.user = current_user
		if @ytlink.save
			redirect_to song_ytlinks_path(@song)
		else
			render :action => :new
		end
	end

	private

	def set_song
		@song = Song.find(params[:song_id])
	end

	def set_ytlink
		@ytlink = @song.ytlinks.find(params[:id])
	end

	def ytlink_params
		params.require(:ytlink).permit(:name,:link)
	end

end
