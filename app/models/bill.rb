class Bill < ActiveRecord::Base
	validates :amount, presence: true, :numericality => { :less_than_or_equal_to => 10000000, :greater_than => 0 }
	validates :purchase_date, presence: true # Update REGEX for date format and val date < current date
	validates :user_id, presence: true
	validates :project_id, presence: true
	belongs_to :project
	order(created_at: :desc)
	belongs_to :user
end
