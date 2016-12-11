Rails.application.routes.draw do
  root 'page#top'

  devise_for :users

  resources :users do
    resources :addresses
    resources :books, shallow: true do
      resources :parents, only: [:create], shallow: true do
        resources :children, only: [:new, :create, :destroy], shallow: true
        resources :parent_children, only: [:create, :update], shallow: true do
          resources :messages, except: [:show], shallow: true
        end
      end
    end
  end

  resources :parents, only: [:index, :show]

end
