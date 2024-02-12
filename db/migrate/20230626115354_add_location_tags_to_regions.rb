class AddLocationTagsToRegions < ActiveRecord::Migration[7.0]
  def change
    change_table :regions, bulk: true do |t|
      t.string :location_tags
    end
  end
end
