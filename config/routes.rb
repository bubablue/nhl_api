Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :players, only: [:index, :show, :create, :update, :destroy, :delete]
  delete :players, to: 'players#delete'
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#root'
end
