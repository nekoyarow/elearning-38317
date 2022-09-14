Rails.application.routes.draw do
  root to: 'learnings#index'
  resources :learnings, only: :index
end
