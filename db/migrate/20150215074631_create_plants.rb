class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.text :family_name
      t.text :chinese_family_name
      t.text :scientific_name
      t.text :chinese_name
      t.text :common_name
      t.text :type
      t.text :photo_urls #serialized
      t.timestamps
    end
  end
end
