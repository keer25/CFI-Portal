class BillsController < ApplicationController

	before_action :logged_in_user

	def new
		@bill = Bill.new
	end

	# Update error messages 
	def create
		bill_init = bill_params
		bill_init[:user_id] = session[:user_id]
		#bill_init[:project_id] = (Project.find_by(name: bill_init[:project]) ||
		#												 Project.create(:name => bill_init[:project])).id
		if ( bill_init[:project] != nil)
			bill_init[:project_id] = (Project.find_by(name: bill_init[:project]))
			if ( bill_init[:project_id] == nil )
				if ((bill_init[:project_id] = Project.create( :name => bill_init[:project], :club_id => current_user.club_id ).id) != nil)
				logger.info "Project id obtained"		
				else
				render 'new'
				end
			else 
				proj = Project.find_by(name: bill_init[:project])
				if proj.club_id == current_user.club_id
					bill_init[:project_id] = proj.id
				else
					logger.info "Invalid Club Member"
					render 'new'
				end
			end
		else
			render 'new'
		end
    bill_init.delete :project	
    @bill = Bill.new(bill_init)
    if (@bill.save)
    	logger.info "Saved Bill"
    else 
    	logger.info "Bill Invalid"	
    end
		redirect_to root_url
	end

	def bill_params
		params.require(:bill).permit(:purchase_date, :project, :amount)
	end
end