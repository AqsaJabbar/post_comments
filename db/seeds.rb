# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user=User.create(
    firstname:"Admin",
    phone: "03223332233",
    email: "test@test.com",
    address: "lahore",
    password: "123456",
    password_confirmation: "123456",
    role: "admin",
    status: "active"
)
