class CreateRegionTrailLinks < ActiveRecord::Migration
  def change
    create_table :region_trail_links do |t|
      t.integer :region_id
      t.integer :trail_id
      t.timestamps
    end
  end
end
