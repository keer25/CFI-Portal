class UsersController < ApplicationController
  def new
  end

  def create 
  	@user = User.new(user_params)
  	if @user.save 
  		#Redirect to Configuring account
  		logger.info( "User Created in database")
  	else 
  		render 'new'
  	end
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


