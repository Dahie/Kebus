# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :app_regions, dependent: :destroy
  has_many :apps, through: :app_regions

  validates :title, presence: true
  validates :wkt_string, presence: true

  before_validation :convert_wkt_string

  def convert_wkt_string
    self.area = RGeo::Geos.factory(srid: 4326).parse_wkt(wkt_string)
  end

  def self.find_by_coordinate(longitude, latitude)
    point = RGeo::Geos.factory(srid: 4326).point(longitude.to_f, latitude.to_f)

    regions = arel_table
    where(regions[:area].st_contains(point))
  end

  rails_admin do
    configure :app_regions do
      visible(false)
    end
  end
end
