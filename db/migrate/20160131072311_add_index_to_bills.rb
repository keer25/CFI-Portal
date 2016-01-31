class AddIndexToBills < ActiveRecord::Migration
  def change
  	add_index :bills, [:user_id, :created_at]
  end
end
