Rails.application.routes.draw do

devise_for :users, :controllers => { :registrations => "registrations" }

 resources :works, only: [:show, :index] do
   resources :resumes, only: [:new, :create]
 end

  namespace :company do
    resources :works
  end

  namespace :admin do
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
