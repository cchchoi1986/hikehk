class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.text :description #serialized
      t.integer :region_id
      t.integer :difficulty
      t.integer :distance_meters
      t.integer :num_minutes
      t.text :route_url
      t.text :food_supply #serialized
      t.text :warning #serialized
      t.text :photo_urls #serialized
      t.decimal :start_longitude
      t.decimal :start_latitude
      t.decimal :end_longitude
      t.decimal :end_latitude
      t.timestamps
    end
    add_index :trails, :region_id
    add_index :trails, :difficulty
    add_index :trails, :distance_meters
    add_index :trails, :num_minutes
  end
end
