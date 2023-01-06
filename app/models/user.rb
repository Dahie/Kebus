# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  def name
    email.split("@").first.capitalize
  end
end
