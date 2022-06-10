# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'sessions#create'

      resources :videos, only: %i[index] do
        post 'share' => 'videos#create', on: :collection
      end
    end
  end
end
