module DestinationsHelper

  def get_attractions
    Attraction.all.map(&:name)
  end

  def get_activities
    Activity.all.map(&:name)
  end
end
