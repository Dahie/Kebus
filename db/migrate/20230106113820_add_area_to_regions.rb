# frozen_string_literal: true

class AddAreaToRegions < ActiveRecord::Migration[7.0]
  def change
    change_table :regions, bulk: true do |t|
      t.geometry :area, using: :gist
    end
  end
end
