class AddWebStoreUrlToApps < ActiveRecord::Migration[7.0]
  def change
    add_column :apps, :web_store_url, :string
  end
end
