Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root 'welcome#home'

  resources :categories, only: [:index, :show, :new, :create, :edit, :update]
end
