class Club < ActiveRecord::Base
	has_many :projects
	has_many :users
	has_many :bills, through: :projects
end
