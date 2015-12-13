Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  resources :lessons, only: :show
  namespace :lessons do
    resources :genres, only: :show
    resources :searches, only: :show
  end

  resources :coaches, only: [:index, :show]
  namespace :coaches do
    resources :lessons do
      resources :students, only: [:index, :show] do
        resources :chat_messages, only: :index
      end
    end
  end

  namespace :students do
    resources :classes do
      resources :chat_messages, only: :index
    end
  end

end
