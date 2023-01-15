class AppJsonBuilder
  def apps
    App.includes(:app_regions, :regions).all.map do |app|
      app.serializable_hash.merge(regions: app.regions.map { |region| { title: region.title } })
    end
  end

  def json
    apps.to_json
  end

  def write
    File.write('apps.json', json)
  end
end
