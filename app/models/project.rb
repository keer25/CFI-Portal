class Project < ActiveRecord::Base
	belongs_to :club
	has_many :bills
end
