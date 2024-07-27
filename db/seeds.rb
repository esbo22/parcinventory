# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# supprime toute les data
Computer.destroy_all
puts "la table computer à été supprimé"
Client.destroy_all
puts "la table client à été supprimé"

# Creer les Clients
clients = []
5.times do |i|
  clients << Client.create(
    name: "Client #{i + 1}",
    address: "Address #{i + 1}",
    phone: "123456789#{i}",
    location: "Location #{i + 1}"
  )
end
puts "la table client à été créer et de nouveaux clients on été généré"
# Creer les Computers
10.times do |i|
  Computer.create(
    hostname: "computer-#{i + 1}",
    date: Date.today - rand(1..1000).days,
    endoflife: Date.today + rand(100..1000).days,
    assigned_to: "User #{i + 1}",
    processor: ["i3", "i5", "i7", "i9"].sample,
    memory: ["2Go", "4Go", "8Go", "16Go"].sample,
    type_disk: ["HDD", "SSD"].sample,
    vpn: [true, false].sample,
    local_password: "password#{i + 1}",
    local_account: "local_account#{i + 1}",
    client: clients.sample
  )
end
puts "la table computer à été créer et de nouveaux computers on été généré"

puts "Les données de départ ont été créés avec succès"
