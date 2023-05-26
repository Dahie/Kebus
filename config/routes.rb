# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "pages#home"
  devise_for :users

  resources :apps, only: [:index] do
    collection do
      get :health
    end
  end
end
