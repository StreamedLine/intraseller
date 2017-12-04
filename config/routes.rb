Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root "welcome#home"

  resources :categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :items, only: [:index, :show, :new, :create, :edit, :update]

  resources :categories do 
  	resources :items, only: [:index, :show, :new, :create, :update], :controller => "category_items"
  end

  resources :items do 
  	resources :questions, only: [:create], :controller => "item_questions"
  end
end
