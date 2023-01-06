class Region < ApplicationRecord
  has_many :app_regions, dependent: :destroy
  has_many :apps, through: :app_regions

  validates :title, presence: true
end
