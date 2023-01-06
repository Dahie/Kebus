class CreateAppRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :app_regions do |t|
      t.references :app
      t.references :region
      t.timestamps
    end
  end
end
