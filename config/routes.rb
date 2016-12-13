Rails.application.routes.draw do
  root 'page#top'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users do
    resources :addresses
    resources :books, shallow: true do
      resources :parents, only: [:create, :update], shallow: true do
        resources :children, only: [:new, :create, :update, :destroy], shallow: true
        resources :parent_children, only: [:create, :update], shallow: true do
          resources :performances, only: [:new, :create]
        end
      end
    end
  end

  resources :parents, only: [:index, :show]
  resources :parent_children, only: [:show]
end
