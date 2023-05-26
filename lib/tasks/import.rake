# commands used to deploy a Rails application
namespace :kebus do
  desc "import from exported geojson"
  task import: [:environment] do
    regions_data = JSON.parse(File.read('regions.json'))
    regions_data['features'].each do |region_data|
      wkt_string = RGeo::GeoJSON.decode(region_data['geometry'])
      options = region_data['properties'].slice('title').merge('wkt_string' => wkt_string)
      region = Region.create(**options)
      region_data.dig('properties', 'apps').each do |app_data|
        attributes = app_data.slice('title', 'play_store_url', 'app_store_url', 'web_store_url', 'website_url', 'huawei_store_url', 'created_at', 'updated_at')
        app = App.find_or_create_by(attributes)
        AppRegion.create(region: region, app: app)
      end
    end
  end
end
