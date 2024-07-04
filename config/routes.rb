Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'patients#index', as: :authenticated_root
  end

  # ログインしていないユーザーのデフォルトのルート
  unauthenticated do
    root to: 'deshboard#index', as: :unauthenticated_root
  end

  
  resources :patients, only: [:index, :new, :create, :show, :edit] do
    resources :medications, only: [:index, :new, :create, :show]
  end
end
