Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', 'homes#about'

  devise_for :users
    authenticated :user do
      resources :books, only:[:index, :edit, :create, :update, :show, :destroy]
      resources :users, only:[:index, :edit, :update, :show]
    end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
