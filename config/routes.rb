Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :bathrooms, only: [:index, :show, :destroy]
  end

  resources :bathrooms do
    resources :reviews, only: [:index, :new, :create, :destroy]
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end
end
