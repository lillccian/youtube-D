class YtlinksController < ApplicationController
	
	before_action :authenticate_user!
	before_action :set_song
	before_action :set_ytlink, :only => [:show, :edit, :update, :destroy]

	def index
		@ytlinks = @song.ytlinks
	end

	def edit
		respond_to do |format|
			format.js
		end
	end

	def update
		if @ytlink.update(ytlink_params)
			@ytlink = Ytlink.new
			@ytlinks = @song.ytlinks.all
			respond_to do |format|
				format.js
			end
		else
			render :action => :edit
		end
	end

	def destroy
		@array = @song.ytlinks.pluck(:link)
		@arrid = @array.index(@ytlink.link) 
		@ytlinks = @song.ytlinks.all
		@ytlink.destroy
		respond_to do |format|
			format.js
		end
	end

	def new
		if params[:order]
			@id = @song.id
			@ytlink = Ytlink.new
			@ytlinks = @song.ytlinks.all
			respond_to do |format|
				format.js
			end
		else
			@ytlink = Ytlink.new
			@ytlinks = @song.ytlinks.all
			respond_to do |format|
				format.js
			end
		end
	end

	def create
		@ytlink = @song.ytlinks.new(ytlink_params)
		@ytlink.user = current_user

		if @ytlink.save
			@ytlink = Ytlink.new
			@ytlinks = @song.ytlinks.all
			data = @ytlinks.pluck(:link)
			ActionCable.server.broadcast( "song_#{@song.id}", data)
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
