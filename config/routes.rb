Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles, only: [:index, :new, :show, :create] do
    resources :comments, only: [:index, :create]
  end

  namespace :my do
    resources :articles, only: [:index, :show, :edit, :update, :destroy]
  end

end
