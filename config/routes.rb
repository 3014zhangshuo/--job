Rails.application.routes.draw do

devise_for :users, :controllers => { :registrations => "registrations" }

 resources :works, only: [:show, :index] do
   resources :resumes, only: [:new, :create]
 end

 resources :applies, only: [:new, :create]

  namespace :company do
    resources :works do
      resources :resumes
    end
  end

  resources :notifications, only: [] do
    member do
      get :redirect_notification
    end
  end

  namespace :admin do
    resources :applies, only: [:index, :show, :destroy] do
      member do
        post :application
      end
    end
    resources :works do
      member do
        post :publish
        post :hide
      end
    end
    resources :users, only: [:index, :show, :destroy] do
      member do
        post :admin
        post :user
      end
    end
  end

  root "works#index"

end
