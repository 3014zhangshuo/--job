Rails.application.routes.draw do

devise_for :users, :controllers => { :registrations => "registrations" }

  namespace :company do
    resources :works
  end

  namespace :admin do
    resources :works
    resources :users, only: [:index, :show, :destroy] do
      member do
        post :admin
        post :user
      end
    end
  end

  root "works#index"

end
