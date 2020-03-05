Rails.application.routes.draw do
  root to: "user/homes#top"
  get "about" => "user/homes#about"
  devise_for :users

  namespace :user do
    resources :users
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
