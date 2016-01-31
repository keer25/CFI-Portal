class BillsController < ApplicationController

	before_action :logged_in_user

	def new
		@bill = Bill.new
	end

	def create
		bill_init = bill_params
		bill_init[:user_id] = session[:user_id]
		bill_init[:project_id] = (Project.find_by(name: bill_init[:project]) ||
														 Project.create(:name => bill_init[:project])).id
    bill_init.delete :project	
    @bill = Bill.new(bill_init)
    if (@bill.save)
    	logger.info "Saved Bill"
    else 
    	logger.info "Bill Invalid"	
    end
		logger.info bill_init
		redirect_to root_url
	end

	def bill_params
		params.require(:bill).permit(:purchase_date, :project, :amount)
	end
end