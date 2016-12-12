Rails.application.routes.draw do
  root 'page#top'

  devise_for :users

  resources :users do
    resources :addresses
    resources :books, shallow: true do
      resources :parents, only: [:create, :update], shallow: true do
        resources :children, only: [:new, :create, :update, :destroy], shallow: true
        resources :parent_children, only: [:create, :update], shallow: true
      end
    end
  end

  resources :parents, only: [:index, :show]
  resources :parent_children, only: [:show]
end
