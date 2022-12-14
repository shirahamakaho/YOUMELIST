Rails.application.routes.draw do

  devise_for :users,controllers:{
    registrations:"user/registrations",
    sessions:"user/sessions"
  }
  
  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  
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
      resources:comments,only:[:create,:edit,:update,:destroy] do
        resource:favorites,only:[:create,:destroy]
      end
    end
    resources:users,only:[:show,:edit,:update,:destroy] do
      member do
        get :favorites
      end
    end
    resources:lists,only:[:create,:update,:destroy]
    get "search" => "searches#search"#検索用
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
