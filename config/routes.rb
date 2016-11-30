Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :books, shallow: true do
      resources :parents, only: [:create], shallow: true do
        resources :children, only: [:new, :create], shallow: true
      end
    end
  end

  resources :parents, only: [:index]








end
