Rails.application.routes.draw do
  root 'page#top'
  get 'users/get_area'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users do
    resources :addresses
    resources :books, only: [:new, :create, :destroy], shallow: true do
      resources :parents, only: [:create, :update], shallow: true do
        resources :children, only: [:new, :create, :update, :destroy], shallow: true
        resources :parent_children, only: [:create, :update], shallow: true
      end
    end
  end

  resources :parents, only: [:index, :show]
  resources :parent_children, only: [:show] do
    resources :evaluations, only: [:new, :create]
  end
end
