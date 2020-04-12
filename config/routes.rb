Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about', 'homes#about'

  devise_for :users
    authenticated :user do
      root to: 'uses#show', as: :user_root
      resources :books, only:[:index, :edit, :create, :update]
      resources :users, only:[:index, :edit, :create, :update, :show]
    end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
