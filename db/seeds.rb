# db/seeds.rb

require 'ruby-progressbar'

# Supprime toutes les données existantes
Computer.destroy_all
puts "La table computer a été supprimée"
Client.destroy_all
puts "La table client a été supprimée"
User.destroy_all
puts "La table user a été supprimée"

# Créer un compte de test spécifique
test_user = User.create!(
  email: "test@exemple.com",
  password: "testtest"
)
puts "Utilisateur de test créé : test@exemple.com"

# Créer des utilisateurs supplémentaires pour diversifier les données
users = [test_user]
2.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}"
  )
end
puts "Des utilisateurs supplémentaires ont été créés"

# Créer les clients associés à des utilisateurs
clients = []
client_count = 5
client_bar = ProgressBar.create(total: client_count, title: "Création de clients")

client_count.times do |i|
  clients << Client.create!(
    name: "Client #{i + 1}",
    address: "Address #{i + 1}",
    phone: "0#{rand(100000000..999999999)}", # Numéro de téléphone valide
    location: "Location #{i + 1}",
    user: users.sample # Associer chaque client à un utilisateur aléatoire
  )
  client_bar.increment
end
puts "La table client a été créée et de nouveaux clients ont été générés"

# Créer les ordinateurs associés aux clients
computer_count = 10
computer_bar = ProgressBar.create(total: computer_count, title: "Création de computers")

computer_count.times do |i|
  Computer.create!(
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
    os: ["Windows", "Linux", "macOS"].sample,  # Ajout du champ `os`
    client: clients.sample
  )
  computer_bar.increment
end
puts "La table computer a été créée et de nouveaux computers ont été générés"

puts "Les données de départ ont été créées avec succès"
