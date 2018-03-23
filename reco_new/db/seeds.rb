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
destination2 = Destination.find_or_create_by(name: "Malaysia")

activity = Activity.find_or_create_by(name: "Adventure", description: "Looking for some adventtures!!")
attraction = Attraction.find_or_create_by(name: "Wildlife", description: "Wildlife is fun!!")

activity2 = Activity.find_or_create_by(name: "Entertainment", description: "Looking for some entertainment!!")
attraction2 = Attraction.find_or_create_by(name: "Nature", description: "Nature is awesome!!")

activity3 = Activity.find_or_create_by(name: "Calm", description: "Looking for calm activity!!")
attraction3 = Attraction.find_or_create_by(name: "Deserts", description: "Deserts are hot!!")

activity4 = Activity.find_or_create_by(name: "Sports", description: "Looking for some sports!!")
attraction4 = Attraction.find_or_create_by(name: "Beaches", description: "Beaches are soothing!!")

tag = Tag.create(taggeable_type: "Destination", taggeable_id: Destination.first.id, tag_entity_type: "Activity", tag_entity_id: Activity.first.id)

Activity.all.each_with_index do |activity, index|
  destination = (index%2 == 0) ? Destination.first : Destination.last
  Tag.create(taggeable_type: "Destination", taggeable_id: destination.id, tag_entity_type: "Activity", tag_entity_id: activity.id)
end

Attraction.all.each_with_index do |attraction, index|
  destination = (index%2 == 0) ? Destination.first : Destination.last
  Tag.create(taggeable_type: "Destination", taggeable_id: destination.id, tag_entity_type: "Attraction", tag_entity_id: attraction.id)
end