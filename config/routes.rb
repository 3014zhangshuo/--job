Rails.application.routes.draw do
  devise_for :users

  namespace :company do
    resources :works
  end

  root "works#index"
end
