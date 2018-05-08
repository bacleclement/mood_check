Rails.application.routes.draw do

  get 'pages/home'

  devise_for :users
  resources :profiles, only: [ :show, :new, :create, :edit, :update ]
  resources :thought_checks do
    resources :questions
  end
  resources :tasks

  get 'thought_checks/new_situation', to: 'thought_checks#new_situation', as: 'new_situation'
  # post 'thought_checks/create_situation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
