class Project < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 100 }
	validates :club_id, presence: true
	belongs_to :club
	has_many :bills
end
