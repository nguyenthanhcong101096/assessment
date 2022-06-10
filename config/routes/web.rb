# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: %i[passwords], path: '', path_names: {
    'sign_in':  'signin',
    'sign_out': 'signout',
    'sign_up':  'signup'
  }, controllers: {
    'sessions': 'sessions',
    'registrations': 'registrations'
  }
  
  resource :likes, only: %i[create]
  resource :videos, only: %i[create show] do
    get 'share'   => 'videos#new'
    get 'myshare' => 'videos#index'
  end

  get '*path' => 'pages#not_found'
  get '/'     => 'pages#index'

  root to: redirect('/'), as: 'root'
end
