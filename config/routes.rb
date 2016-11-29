Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :books, shallow: true do
      resources :parents, only: [:new, :create], shallow: true
    end
  end








end
