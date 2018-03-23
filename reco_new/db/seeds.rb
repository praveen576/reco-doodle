# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user = User.create(email: "admin@reco.com", password: "123456")

role = Role.create(name: "admin")
role2 = Role.create(name: "traveller")

user.roles << role

destination = Destination.find_or_create_by(name: "Kerala")

activity = Activity.find_or_create_by(name: "Adventure", description: "Looking for some adventtures!!")
attraction = Attraction.find_or_create_by(name: "Wildlife", description: "Wildlife is fun!!")

tag = Tag.create(taggeable_type: "Destination", taggeable_id: Destination.first.id, tag_entity_type: "Activity", tag_entity_id: Activity.first.id)