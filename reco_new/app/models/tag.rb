class Tag < ApplicationRecord

  belongs_to :taggeable, polymorphic: true

  belongs_to :tag_entity, polymorphic: true

  TRIP_TYPES = {
    :couple => "Couple",
    :family => "Family",
    :friends => "Friends",
    :solo => "Solo",
    :not_sure => "I don't know/I am just exploring"
  }

end
