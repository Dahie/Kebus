class App < ApplicationRecord
  has_many :regions, through: :app_regions
  has_many :app_regions, dependent: :destroy

  validates :title, presence: true
end
