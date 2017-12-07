Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root "welcome#home"

  # resources :categories
  # resources :items

  resources :categories, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :items, only: [:index, :show, :new, :create, :update], :controller => "category_items"
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :questions, only: [:create], :controller => "item_questions"
  end
end
