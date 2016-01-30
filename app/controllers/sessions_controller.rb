class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	logger.info("Valid User Signed in")
    	log_in(user)
    # Log in the user and redirect to user space
    else
    	logger.info( "Invalid User rejected login" )
    	render 'new'
    end	
  end

  def destroy
  	logger.info("User logged out")
  	redirect_to roor_url
  end
end
