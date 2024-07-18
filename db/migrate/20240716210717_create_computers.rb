class CreateComputers < ActiveRecord::Migration[7.1]
  def change
    create_table :computers do |t|
      t.string :hostname
      t.string :date
      t.string :endoflife
      t.string :assigned_to
      t.string :processor
      t.string :memory
      t.string :type_disk
      t.string :vpn
      t.string :local_password
      t.string :local_account

      t.timestamps
    end
  end
end
