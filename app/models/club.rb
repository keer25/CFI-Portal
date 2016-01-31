class Club < ActiveRecord::Base
	validates :name, presence: true
	has_many :projects
	has_many :users
	has_many :bills, through: :projects
end
