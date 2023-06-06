# frozen_string_literal: true

class AddSlugToApps < ActiveRecord::Migration[7.0]
  def change
    add_column :apps, :slug, :string
    add_index :apps, :slug, unique: true
  end
end
