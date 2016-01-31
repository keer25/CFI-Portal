class UsersController < ApplicationController
  def new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save 
  		#redirect_to current_user
  		logger.info( "User Created in database")
  	else 
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
  end 

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


