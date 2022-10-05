Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == "admin" } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, :only => [:index,:show,:edit,:update]

  resources :posts do
    member do
      get :approve
    end
    resources :comments
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
