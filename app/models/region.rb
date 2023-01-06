# frozen_string_literal: true

class Region < ApplicationRecord
  has_many :app_regions, dependent: :destroy
  has_many :apps, through: :app_regions

  attr_accessor :wkt_string2

  validates :title, presence: true

  before_validation :convert_wkt_string

  def convert_wkt_string
    self.area = RGeo::Geos.factory(srid: 4326).parse_wkt(wkt_string)
  end
end
