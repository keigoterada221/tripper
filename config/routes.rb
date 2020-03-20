Rails.application.routes.draw do
      get "admin/top" => "admin/homes#top", as: :admin_top
      root to: "user/homes#top"
      get "about" => "user/homes#about"
      get "favorites" => "user/users#favorite" , as: :favorites
      get "prefecture" => "user/homes#prefecture", as: :prefecture
      # Devise skip: :allで不要なURLを表示させない
      devise_for :users
      devise_for :admins, skip: :all
        devise_scope :admin do
            get "admin/sign_in" => "admin/sessions#new",as: :new_admin_session
            post "admin/sign_in" => "admin/sessions#create",as: :admin_session
            delete "admin/sign_out" => "admin/sessions#destroy",as: :destroy_admin_session
        end
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

        resources :notifications, only: [:index]
    end

    namespace :admin do
        resources :users, only: [:index,:show,:edit,:update,:destroy]
        resources :posts, only: [:index,:show,:destroy] do
            resources :comments, only: [:destroy]
        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
