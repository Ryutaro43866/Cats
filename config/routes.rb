Rails.application.routes.draw do
  root to: "homes#top"
  get '/about' => 'homes#about', as: :about

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    resources :items do
      resource :favorites, only: [:index, :create, :destroy]
      resources :item_comments, only: [:create, :destroy]
    end

    resources :customers, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/search', to: 'searches#search'

    devise_scope :customer do
      post 'customers/guest_sign_in', to: 'sessions#guest_sign_in'
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:show, :edit, :update]
  end
end
