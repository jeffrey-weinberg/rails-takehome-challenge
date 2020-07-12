# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'buildings#index'

  resources :buildings, only: %i[index show] do
    resources :offices, only: %i[index show new create] do
      resources :companies, only: %i[index show] do
        resources :employees, only: %i[new create destroy]
      end
    end
  end

  resources :companies do
    resources :employees, only: %i[new create destroy]
  end

  resources :offices, only: %i[new create show]
end
