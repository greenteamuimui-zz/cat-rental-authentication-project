# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
User.destroy_all
CatRentalRequest.destroy_all
u1 = User.create(user_name: "Clare", password: "apple1")
c1 = Cat.create(birth_date: "01/01/2000", color: "brown", name: "Apple", sex: "F", user_id: u1.id )
c2 = Cat.create(birth_date: "01/01/2001", color: "black", name: "Dog", sex: "M", user_id: u1.id )
u2 = User.create(user_name: "Cherry", password: "dog123")
