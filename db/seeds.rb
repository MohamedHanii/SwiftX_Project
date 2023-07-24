# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
roles = %w[admin manager user]

roles.each do |role_name|
  Role.create(role_type: role_name)
end




# Create users with different role_id values
User.create(username: 'admin', password: 'admin', role_id: 1)
User.create(username: 'manager', password: 'manager', role_id: 2)
User.create(username: 'user', password: 'user', role_id: 3)