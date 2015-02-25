class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description #serialized
      t.integer :region_id
      t.float :difficulty
      t.float :scenery
      t.float :distance
      t.float :duration
      t.text :route_url
      t.text :food_supply #serialized
      t.text :warning #serialized
      t.text :photo_urls #serialized
      t.text :start_coordinates #serialized
      t.text :end_coordinates #serialized
      t.text :trail_coordinates #serialized
      t.timestamps
    end
    add_index :trails, :region_id
    add_index :trails, :difficulty
    add_index :trails, :distance
    add_index :trails, :duration
  end
end
