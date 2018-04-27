Rails.application.routes.draw do

  get 'pages/home'

  devise_for :users
  resources :profiles, only: [ :show, :new, :create, :edit, :update ]
  resources :thought_checks do
    resources :questions
  end
  resources :tasks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
