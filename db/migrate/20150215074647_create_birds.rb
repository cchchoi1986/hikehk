class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.text :family_name
      t.text :scientific_name
      t.text :common_name
      t.text :photo_urls #serialized
      t.timestamps
    end
  end
end
