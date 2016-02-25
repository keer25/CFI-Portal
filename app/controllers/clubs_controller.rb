class ClubsController < ApplicationController
	before_action :admin_user

	def new 
		@club = Club.new
	end

	def create
		Club.create!(club_params)
		redirect_to current_user
	end
	private

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

	def club_params
		params.require(:club).permit(:name)
	end
end
