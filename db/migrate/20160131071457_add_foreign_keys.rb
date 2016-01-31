class AddForeignKeys < ActiveRecord::Migration
  def change
  	add_foreign_key :users, :clubs
  	add_foreign_key :bills, :projects
  	add_foreign_key :projects, :clubs
  	add_reference :bills, :user, index: true, foreign_key: true
  end
end
