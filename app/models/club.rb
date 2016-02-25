class Club < ActiveRecord::Base
	validates :name, presence: true,uniqueness: {  case_sensitive: false }
	has_many :projects
	has_many :users
	has_many :bills, through: :projects
end
