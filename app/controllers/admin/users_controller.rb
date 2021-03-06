class Admin::UsersController < ApplicationController

	before_action :authenticate_user! 
	before_action :check_admin 
	def index
		@songs = Song.all
		@tags = Tag.all
	end

	private

	def check_admin
		unless current_user.role == "admin"
			redirect_to root_path			
		end
	end
	
end
