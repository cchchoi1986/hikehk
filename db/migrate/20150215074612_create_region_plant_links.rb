class CreateRegionPlantLinks < ActiveRecord::Migration
  def change
    create_table :region_plant_links do |t|
      t.integer :region_id
      t.integer :plant_id
      t.timestamps
    end
  end
end
