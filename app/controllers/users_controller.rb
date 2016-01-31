class UsersController < ApplicationController
  def new
  end

  def create 
    user_init = user_params
    user_init[:club_id] = (Club.find_by :name => params[:user][:club]).id
    user_init.delete :club
  	@user = User.new(user_init)
  	if @user.save 
      log_in @user
  		redirect_to current_user
  		logger.info( "User Created in database" )
  	else 
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
  end 

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :club)
  end
end


