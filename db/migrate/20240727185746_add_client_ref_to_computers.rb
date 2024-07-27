class AddClientRefToComputers < ActiveRecord::Migration[7.1]
  def change
    add_reference :computers, :client, null: false, foreign_key: true
  end
end
