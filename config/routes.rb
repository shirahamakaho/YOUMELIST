Rails.application.routes.draw do

  devise_for :users,controllers:{
    registrations:"user/registrations",
    sessions:"user/sessions"
  }
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }

  root 'homes#top'

  namespace :admin do
    resources:dreams,only:[:index,:destroy]
    resources:comments,only:[:index,:destroy]
    resources:users,only:[:index,:update]
  end

  scope module: :user do
    resources:dreams,only:[:index,:show,:create] do
      resources:comments,only:[:create,:update,:destroy] do
        resource:favorites,only:[:create,:destroy]
      end
    end
    resources:users,only:[:show,:edit,:update] do
      member do
        get :favorites
      end
    end
    resources:lists,only:[:create,:destroy]
    get "search" => "searches#search"# 検索用
    get "/users/:id/unsubscribe" => "users#unsubscribe",as: 'unsubscribe'
    patch "/users/:id/withdrawal" => "users#withdrawal",as: 'withdrawal'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
