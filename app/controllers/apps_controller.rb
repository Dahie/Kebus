# frozen_string_literal: true

class AppsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @apps = App.all
  end
end
