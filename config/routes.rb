Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users,controllers:{
    registrations:"user/registrations",
    sessions:"user/sessions"
  }
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  namespace :admin do
  end

  scope module: :user do
    resources:dreams,only:[:index,:show,:create] do
      resources:comments,only:[:create,:update,:destroy]do
        resource:favorites,only:[:create,:destroy]
      end
    end
    resources:users,only:[:show,:edit,:update]
    resources:lists,only:[:show,:create,:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
