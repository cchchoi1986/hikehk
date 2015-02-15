class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|

      t.timestamps
    end
  end
end
