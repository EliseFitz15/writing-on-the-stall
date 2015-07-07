Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

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
