class CreateRegionBirdLinks < ActiveRecord::Migration
  def change
    create_table :region_bird_links do |t|
      t.integer :region_id
      t.integer :bird_id
      t.timestamps
    end
  end
end
