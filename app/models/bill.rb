class Bill < ActiveRecord::Base
	belongs_to :project
	order(created_at: :desc)
	belongs_to :user
end
