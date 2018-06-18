class Addassignedtoticketstable < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assigned_to, :integer
  end
end
