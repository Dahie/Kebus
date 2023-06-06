# frozen_string_literal: true

class AddHuaweiStoreUrlToApps < ActiveRecord::Migration[7.0]
  def change
    change_table :apps, bulk: true do |t|
      t.string :huawei_store_url
    end
  end
end
