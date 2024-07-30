Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root to: 'patients#index', as: :authenticated_root
  end

  # ログインしていないユーザーのデフォルトのルート
  unauthenticated do
    root to: 'deshboard#index', as: :unauthenticated_root
  end

  
  resources :patients, only: [:index, :new, :create, :show, :edit] do
    resources :medications, only: [:new, :create]
  end
  
end
