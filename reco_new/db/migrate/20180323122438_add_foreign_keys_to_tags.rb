class AddForeignKeysToTags < ActiveRecord::Migration[5.1]
  def change
    change_table :tags do |t|
      t.references :taggeable, polymorphic: true
      t.references :tag_entity, polymorphic: true
    end
  end
end
