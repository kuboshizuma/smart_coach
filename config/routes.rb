Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  namespace :lessons do
    resources :genres, only: :show
    resources :searches, only: :show
  end
  resources :lessons, only: :show

  namespace :coaches do
    resources :lessons do
      resources :students, only: [:index, :show] do
        resources :chat_messages, only: [:index, :create, :destroy], shallow: true do
          collection do
            post 'pusher'
          end
        end
      end
    end
  end
  resources :coaches, only: [:index, :show]

  namespace :students do
    resources :rooms do
      resources :chat_messages, only: [:index, :create, :destroy], shallow: true do
        collection do
          post 'pusher'
        end
      end
    end
  end

end
