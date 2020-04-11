Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about', 'homes#about'

  devise_for :users
  resources :books, only:[:index, :edit, :create, :update]
  resources :users, only:[:index, :edit, :create, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
