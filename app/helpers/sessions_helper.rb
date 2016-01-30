module SessionsHelper

	#Saves temperory cookies about the session in the browser
	def log_in(user)
		session[ :user_id ] = user.id
	end

	#Returns the instance of the current user
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out(id)
  	session.delete(:user_id)
    @current_user = nil
  end
end
