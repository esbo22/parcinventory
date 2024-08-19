class AddAdditionalFieldsToComputers < ActiveRecord::Migration[7.1]
  def change
    add_column :computers, :lieu, :string
    add_column :computers, :salarie, :string
    add_column :computers, :telephone, :string
    add_column :computers, :os, :string
    add_column :computers, :antivirus, :string
    add_column :computers, :date_fin_antivirus, :date
    add_column :computers, :pack_office_installe, :string
    add_column :computers, :reseau, :string
    add_column :computers, :teamviewer_installe, :boolean
    add_column :computers, :ad, :boolean
    add_column :computers, :rds, :boolean
    add_column :computers, :commentaire, :text
    add_column :computers, :controle_le, :date
  end
end
