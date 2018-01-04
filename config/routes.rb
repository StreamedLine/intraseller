Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }

  authenticated :user do
    root to: 'welcome#home', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :categories, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :items, only: [:index, :show, :new, :create, :update], :controller => 'category_items'
    resources :questions, only: [:create, :delete], :controller => 'category_questions'
  end

  resources :category_items, only: [:edit, :update], :controller => 'category_item_joins'

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do 
  	resources :questions, only: [:create, :delete], :controller => 'item_questions'
  	resources :comparisons, only: [:show, :new, :create], :path_names => {:new => 'available_items'}
    resources :bullets, only: [:create]
  end

  resources :questions, only: [:create, :delete] do 
    resources :answers, only: [:create], :controller => 'question_answers'
  end

  resources :comparisons, only: [:show, :update] do 
    resources :bullets, only: [:create]
  end

  resources :bullets, only: [:destroy]
  resources :answers, only: [:destroy]

  get 'stats/unanswered' => 'stats#unanswered'
  get 'stats/bullets' => 'stats#bullets'
  get 'stats/answers' => 'stats#answers'
  get 'home' => 'welcome#home'
  patch 'username' => 'welcome#update_username'

end
