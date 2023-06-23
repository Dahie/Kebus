# frozen_string_literal: true

class AddDescriptionToApps < ActiveRecord::Migration[7.0]
  def change
    change_table :regions, bulk: true do |t|
      t.text :description
    end
  end
end
