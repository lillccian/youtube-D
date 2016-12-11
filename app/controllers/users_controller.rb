class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, :only=>[:show, :edit, :update]
	def show 
	end
	def edit 
	end 
	def update
		if @user.update(params_user)
			redirect_to songs_path
		else
			render :action=>:edit
		end
	end

	private
	def set_user
		@user = User.find(params[:id])
	end
	def params_user
		params.require(:user).permit(:nickname,:profile,:name)
	end

end
