class Destination < ApplicationRecord

  validates_presence_of :name
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :tags, as: :taggeable

  def self.filter_destinations(params_filter)
    Destination.first(5)
  end

end
