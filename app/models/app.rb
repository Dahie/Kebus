# frozen_string_literal: true

class App < ApplicationRecord
  
  has_many :app_regions, dependent: :destroy
  has_many :regions, through: :app_regions

  validates :title, presence: true
end
