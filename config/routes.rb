Rails.application.routes.draw do
  root to: "user/homes#top"
  get "about" => "user/homes#about"
  get "favorites" => "user/users#favorite" , as: :favorites
  get "prefecture" => "user/homes#prefecture", as: :prefecture
  devise_for :users
  devise_for :admins
  # namespaceと違いurl,pathがそのままで使用可能
  scope module: :user do

    resources :users do
      resource :relationships, only: [:create,:destroy]
      # idが含まれるルーティングを作成
      get :follows,on: :member
      get :followers,on: :member
      get :withdraw
    end

    resources :posts do
      resource :favorites, only: [:create,:destroy]
      resources :comments, only: [:create,:destroy] do
        resource :comment_favorites, only: [:create,:destroy]
      end
    end
  end

  scope module: :admin do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
