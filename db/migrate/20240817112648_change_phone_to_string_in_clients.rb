class ChangePhoneToStringInClients < ActiveRecord::Migration[7.1]
  def change
    change_column :clients, :phone, :string
  end
end
