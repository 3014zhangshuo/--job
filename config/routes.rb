Rails.application.routes.draw do
  devise_for :users

  namespace :company do
    resources :works
  end

  root "welcome#index"
end
