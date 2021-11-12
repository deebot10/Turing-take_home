# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dee = Customer.create(first_name: 'Dee', last_name: 'Hill', email: 'dee@aol.com', address: '123')
ch = Customer.create(first_name: 'Chantele', last_name: 'Sean', email: 'ch@aol.com', address: '222')
kris = Customer.create(first_name: 'Kris', last_name: 'Middleton', email: 'bigK@aol.com', address: '321')

tea1 = Tea.create(title: 'Earl Grey Lavender', description: 'Earl grey with a dab of lavender', temperature: 185, brew_time: 2.5)
tea2 = Tea.create(title: 'Matcha', description: 'Good and Green', temperature: 175, brew_time: 3.5)
tea3 = Tea.create(title: 'Old English', description: 'Bitter', temperature: 160, brew_time: 2.0)

subs1 = Subscription.create!(title: 'Tea Time', price: '4.00', status: 0, frequency: 0, customer_id: dee.id, tea_id: tea1.id)  
subs2 = Subscription.create!(title: 'Matcha Party', price: '2.00', status: 1, frequency: 1, customer_id: dee.id, tea_id: tea2.id)  
subs3 = Subscription.create!(title: 'Ol English Festival', price: '5.00', status: 2, frequency: 0, customer_id: dee.id, tea_id: tea3.id)  