class ChangeTableComputerType < ActiveRecord::Migration[7.1]
  def change
    change_column :computers, :date, :date
    change_column :computers, :endoflife, :date
    change_column :computers, :vpn, :boolean
  end
end
