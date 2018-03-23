class Activity < ApplicationRecord

  has_one :tag, as: :tag_entity
end
