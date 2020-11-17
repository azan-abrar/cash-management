Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations',
    passwords:     'users/passwords',
    confirmations: 'users/confirmations'
  }

  namespace :teacher do
    resources :dashboard, only: %i[index]
  end

  namespace :student do
    resources :dashboard, only: %i[index]
  end
end
