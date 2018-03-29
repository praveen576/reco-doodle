class Activity < ApplicationRecord

  has_one :tag, as: :tag_entity
  INTEREST_RATE = {
    "1" => "No",
    "2" => "May be",
    "3" => "Yes",
  }
end
