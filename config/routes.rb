Rails.application.routes.draw do
  devise_for :users
  root to: "user/homes#top"
  get "user/homes#about"

  namespace :user do
    resources :users
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
