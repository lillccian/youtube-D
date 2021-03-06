class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_song
	before_action :set_comment, :only => [:edit, :update, :destroy]

	def index
		@comments = @song.comments
	end
	def edit
		respond_to do |format|
			format.js
		end
	end
	def update
		if @comment.update(comment_params)
			@comment = Comment.new
			@comments = @song.comments.all
			respond_to do |format|
				format.js
			end
		else
			render :action => :edit
		end
	end
	def new
		@comment = Comment.new
		respond_to do |format|
			format.js
		end
	end
	def create 
		@comment = @song.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			@comment = Comment.new
			@comments = @song.comments.all
			respond_to do |format|
				format.js
			end
		else
			render :action => :new
		end
	end


	def destroy
		@comment.destroy
		@comments = @song.comments.all
		respond_to do |format|
			format.js
		end
	end

	private

	def set_song
		@song = Song.find(params[:song_id])
	end

	def set_comment
		@comment = @song.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:title,:description)
	end

end
