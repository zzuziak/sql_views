# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderProduct.delete_all
Order.delete_all
User.delete_all
Product.delete_all
Account.delete_all

puts "Deleted all records"


Account.create([{
  account_type: "Basic",
  discount: 0,
  priority_shipping: false,
  domestic: true
  },
  {
  account_type: "Basic",
  discount: 0,
  priority_shipping: false,
  domestic: false
  },
  {
  account_type: "Basic",
  discount: 0,
  priority_shipping: false,
  domestic: false
  },
  {
  account_type: "Pro",
  discount: 10,
  priority_shipping: false,
  domestic: false
  },
  {
  account_type: "Pro",
  discount: 10,
  priority_shipping: true,
  domestic: true
  },
  {
  account_type: "Business",
  discount: 15,
  priority_shipping: true,
  domestic: true
  },
  {
  account_type: "Business",
  discount: 12,
  priority_shipping: true,
  domestic: false
  }])

  puts "Created accounts"

100.times do
  User.create(
    name: Faker::Name.unique.name,
    address: Faker::Address.full_address,
    social_security_number: Faker::IDNumber.valid,
    IBAN: Faker::Bank.iban,
    phone: Faker::PhoneNumber.phone_number,
    gender: ["male", "female", "n/a"].sample,
    account_id: rand(1..7)
  )
end

puts "Created users"

400.times do
  Order.create(
    status: ["pending", "paid", "completed"].sample,
    user_id: rand(1..100)
    )
end

puts "Created orders"


100.times do
  Product.create(
    sku: rand(1..400),
    name: Faker::Beer,
    price: rand(5..60),
    margin: rand(0.25..0.65).round(2)
  )
end

puts "Created products"

600.times do
  OrderProduct.create(
    order_id: rand(1..400),
    product_id: rand(1..100)
    )
end

puts "Created order products"
