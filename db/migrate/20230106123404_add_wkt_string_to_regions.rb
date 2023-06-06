# frozen_string_literal: true

class AddWktStringToRegions < ActiveRecord::Migration[7.0]
  def change
    change_table :regions, bulk: true do |t|
      t.text :wkt_string
    end
  end
end
