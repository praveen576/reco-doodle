class AddImageColumnsToAttractions < ActiveRecord::Migration[5.1]
  def up
    add_attachment :attractions, :avatar
  end

  def down
    remove_attachment :attractions, :avatar
  end
end
