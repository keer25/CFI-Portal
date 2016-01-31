class AddAssociations < ActiveRecord::Migration
  def change
  	add_reference :users, :club, index: true
  	add_reference :projects, :club, index: true
  	add_reference :bills, :project, index: true
  end
end
