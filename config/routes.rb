Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists
  resources :items
end
