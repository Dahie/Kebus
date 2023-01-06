# frozen_string_literal: true

class CreateApps < ActiveRecord::Migration[7.0]
  def change
    create_table :apps do |t|
      t.string 'title'
      t.string 'website_url'
      t.string 'play_store_url'
      t.string 'app_store_url'
      t.timestamps
    end
  end
end
