# frozen_string_literal: true

class AddNotesToRegions < ActiveRecord::Migration[7.0]
  def change
    change_table :regions, bulk: true do |t|
      t.text :notes
    end
  end
end
