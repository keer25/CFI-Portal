class RemoveTypeFromClubs < ActiveRecord::Migration
  def change
  	remove_column :clubs, :type, :string
  end
end
