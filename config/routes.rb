Rails.application.routes.draw do
devise_for :users, :controllers => { :registrations => "registrations" }

  namespace :company do
    resources :works
  end

  root "works#index"
end
