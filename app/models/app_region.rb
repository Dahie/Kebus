# frozen_string_literal: true

class AppRegion < ApplicationRecord
  belongs_to :app
  belongs_to :region
end
