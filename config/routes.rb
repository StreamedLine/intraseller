Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  root "welcome#home"

  resources :categories, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :items, only: [:index, :show, :new, :create, :update], :controller => "category_items"
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :questions, only: [:create, :update], :controller => "item_questions"
  	resources :comparisons, only: [:index, :show, :new, :create], :path_names => {:new => 'available_items'}
  end

  resources :comparisons, only: [:show, :update]
end
