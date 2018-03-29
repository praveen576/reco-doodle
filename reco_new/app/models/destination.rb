class Destination < ApplicationRecord

  validates_presence_of :name

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :tags, as: :taggeable

  def self.filter_destinations(params_filter)
    trip_type_ids = TripType.where(name: params_filter[:trip_type]).pluck(:id).presence || [0]
    attraction_ids = Attraction.where(name: params_filter[:attractions]).pluck(:id).presence || [0]

    must_have_activities = params_filter[:activities].map{|act| act.split('-')}.select{|act| act.last == "Yes" }.map(&:first)
    must_have_activity_ids = Activity.where(name: must_have_activities).pluck(:id).presence || [0]

    should_have_activities = params_filter[:activities].map{|act| act.split('-')}.select{|act| act.last == "May be" }.map(&:first)
    should_have_activity_ids = Activity.where(name: should_have_activities).pluck(:id).presence || [0]

    must_match_items_count = (attraction_ids - [0]).count + (must_have_activity_ids - [0]).count

    attraction_where = "( tag_entity_type = 'attraction' AND tag_entity_id IN (#{attraction_ids.join(',')}) )"
    must_have_activities_where = "( tag_entity_type = 'activity' AND tag_entity_id IN (#{must_have_activity_ids.join(',')}) )"
    should_have_activities_where = "( tag_entity_type = 'activity' AND tag_entity_id IN (#{should_have_activity_ids.join(',')}) )"
    trip_type_where = "( tag_entity_type = 'TripType' AND tag_entity_id IN (#{trip_type_ids.join(',')}) )"


    nested_q_where_clause = [attraction_where,must_have_activities_where,should_have_activities_where, trip_type_where].join(" OR ")

    nested_q_select_clause = "taggeable_id,
      ( CASE WHEN(tag_entity_type = 'attraction') THEN 1 WHEN(tag_entity_type = 'activity' and tag_entity_id IN (#{must_have_activity_ids.join(',')})) THEN 1 ELSE 0 END ) as must_match_flag,
      ( case when(tag_entity_type = 'activity' and tag_entity_id IN (#{should_have_activity_ids.join(',')})) Then weight*0.1 Else weight END ) as norm_sec_weight,
      ( case when(tag_entity_type = 'TripType') Then weight Else 0 End ) as norm_trip_type_weight"

    nested_q_r = Tag.where(nested_q_where_clause).select(nested_q_select_clause)

    dest_ids = Tag.select("taggeable_id").from(nested_q_r).group(:taggeable_id).having("sum(must_match_flag) = ?", must_match_items_count).order("sum(norm_trip_type_weight) desc, sum(norm_sec_weight) desc").map(&:taggeable_id)

    # temp = Tag.select("taggeable_id, sum(norm_trip_type_weight) as ps, sum(norm_sec_weight) as ss").from(nested_q_r).group(:taggeable_id).having("sum(must_match_flag) = ?", must_match_items_count).order("sum(norm_trip_type_weight) asc, sum(norm_sec_weight) desc").map{|e| [e.taggeable_id, e.ps, e.ss] }
    Destination.where(id: dest_ids)
  end

end
