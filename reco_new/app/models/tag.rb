class Tag < ApplicationRecord

  belongs_to :taggeable, polymorphic: true

  belongs_to :tag_entity, polymorphic: true

end
