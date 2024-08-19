class AddAntivirusToComputers < ActiveRecord::Migration[7.1]
  def change
    add_column :computers, :antivirus_name, :string
    add_column :computers, :antivirus_duration, :integer
    add_column :computers, :antivirus_start_date, :date
  end
end
