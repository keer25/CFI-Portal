class AddColumnToBills < ActiveRecord::Migration
  def change
    add_column :bills, :purchase_date, :date
    add_column :bills, :amount, :decimal
  end
end
