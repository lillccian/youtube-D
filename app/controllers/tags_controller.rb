class TagsController < ApplicationController
	
	before_action :authenticate_user!
	before_action :set_tag, :only => [:show, :edit, :update, :destroy]

	def index
		@tags = Tag.all
	end
	def show
	end
	def edit
	end
	def update
		if @tag.update(tag_params)
			redirect_to songs_path
		else
			render :action => :edit
		end
	end
	def new 
		@tag = Tag.new
	end
	def create 
		@tag = Tag.new(tag_params)
		if @tag.save
			redirect_to songs_path
		else	
			render :action => :new
		end
	end 
	def destroy
		@tag.destroy
		redirect_to songs_path
	end

	private

	def tag_params
		params.require(:tag).permit(:tag)
	end
	def set_tag
		@tag = Tag.find(params[:id])
	end

end
