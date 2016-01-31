class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	logger.info("Valid User Signed in")
    	log_in(user)
      redirect_to current_user
    else
    	logger.info( "Invalid User rejected login" )
    	render 'new'
    end	
  end

  def destroy
  	logger.info("User logged out")
    log_out(params[:id])
  	redirect_to root_url
  end
end
