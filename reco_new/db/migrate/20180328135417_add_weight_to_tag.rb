class AddWeightToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :weight, :float, default: 1
  end
end
