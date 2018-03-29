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

dest_names = ["Kerala", "Goa", "Himachal", "Sikkim", "Kashmir", "Bali", "Malaysia", "Maldives", "Singapore", "Thailand", "Andaman", "Gujrat"]

dest_names.each do |dest_name|
  Destination.find_or_create_by(name: dest_name)  
end

attraction_names = ["Wildlife", "Hill Station", "Lakes", "Beaches", "Desserts", "Urban Cities", "Historic Places", "Religious"]

attraction_names.each do |att_name|
  Attraction.find_or_create_by(name: att_name, description: att_name)
end

activities = ["Romantic", "Adventure", "Relaxing", "Fun", "Health"]
activities.each do |act_name|
  Activity.find_or_create_by(name: act_name, description: act_name)
end

dest_attraction_map = YAML.load_file (Rails.root.join('db', 'dest_attraction.yml').to_s)
dest_attraction_map.each do |dest_name, attractions|
  destination = Destination.find_by_name(dest_name)
  attractions.each do |attraction_name|
    attraction = Attraction.find_by_name(attraction_name)
    Tag.create(taggeable_type: "Destination", taggeable_id: destination.id, tag_entity_type: "Attraction", tag_entity_id: attraction.id)    
  end
end

dest_activity_map = YAML.load_file (Rails.root.join('db', 'dest_activity_map.yml').to_s)
dest_activity_map.each do |dest_name, activities_with_weight|
  destination = Destination.find_by_name(dest_name)
  activities_with_weight.each do |activity_with_weight|
    activity = Activity.find_by_name(activity_with_weight.first)
    Tag.create(taggeable_type: "Destination", taggeable_id: destination.id, tag_entity_type: "Activity", tag_entity_id: activity.id, weight: activity_with_weight.last)    
  end
end


trip_types = ["couple", "family", "friends", "solo"]

trip_types.each do |tt|
  TripType.find_or_create_by(name: tt)
end

dest_trip_type_map = YAML.load_file (Rails.root.join('db', 'dest_trip_type_map.yml').to_s)
dest_trip_type_map.each do |dest_name, trip_types_with_weight|
  destination = Destination.find_by_name(dest_name)
  trip_types_with_weight.each do |trip_type_with_weight|
    trip_type = TripType.find_by_name(trip_type_with_weight.first)
    Tag.create(taggeable_type: "Destination", taggeable_id: destination.id, tag_entity_type: "TripType", tag_entity_id: trip_type.id, weight: trip_type_with_weight.last)
  end
end
