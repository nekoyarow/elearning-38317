Rails.application.routes.draw do
  devise_for :users
  root to: 'learnings#index'
  resources :learnings do
    resources :plays, only: [:index, :create]
  end
end
