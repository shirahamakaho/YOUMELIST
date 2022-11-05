Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users,controllers:{
    registrations:"user/registrations",
    sessions:"user/sessions"
  }
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
