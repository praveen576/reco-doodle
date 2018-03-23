class AddImageColumnsToDestinations < ActiveRecord::Migration[5.1]
  def up
    add_attachment :destinations, :avatar
  end

  def down
    remove_attachment :destinations, :avatar
  end
end
