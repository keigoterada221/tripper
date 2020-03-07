Rails.application.routes.draw do
  root to: "user/homes#top"
  get "about" => "user/homes#about"
  devise_for :users
  devise_for :admins
  # namespaceと違いurl,pathがそのままで使用可能
  scope module: :user do
    resources :users do
      resource :relationships, only: [:create,:destroy]
      # idが含まれるルーティングを作成
      get :follows,on: :member
      get :followers,on: :member
    end
    resources :posts
  end

  scope module: :admin do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
