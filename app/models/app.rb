# frozen_string_literal: true

class App < ApplicationRecord
  has_many :app_regions, dependent: :destroy
  has_many :regions, through: :app_regions

  validates :title, presence: true

  rails_admin do
    configure :app_regions do
      visible(false)
    end
  end
end
