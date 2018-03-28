class CreateTripTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
