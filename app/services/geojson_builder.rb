# frozen_string_literal: true

class GeojsonBuilder
  def geohash
    {
      type: "FeatureCollection",
      features: regions
    }
  end

  def geojson
    geohash.to_json
  end

  def write
    File.write('regions.json', geojson)
  end

  private

  def regions
    Region.includes(:app_regions, :apps).all.map do |region|
      build_feature(region)
    end
  end

  def build_feature(region)
    {
      type: "Feature",
      properties: {
        title: region.title,
        apps: region.apps.map { |app| app.serializable_hash }
      },
      geometry: RGeo::GeoJSON.encode(region.area)
    }
  end
end
