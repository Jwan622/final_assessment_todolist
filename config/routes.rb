Rails.application.routes.draw do
  get 'photos/destroy'

  root to: "lists#index"
  resources :lists
  resources :tasks
  resources :photos, only: [:destroy]
end
