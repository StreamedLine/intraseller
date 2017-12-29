Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }

  authenticated :user do
    root to: 'welcome#home', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :categories, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :items, only: [:index, :show, :new, :create, :update], :controller => 'category_items'
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :questions, only: [:create, :update, :delete], :controller => 'item_questions'
  	resources :comparisons, only: [:show, :new, :create], :path_names => {:new => 'available_items'}
  end

  resources :questions, only: [:create, :update, :delete], :controller => 'item_questions' do 
    resources :answers, only: [:create, :update, :delete], :controller => 'question_answers'
  end

  resources :comparisons, only: [:show, :update]
end
