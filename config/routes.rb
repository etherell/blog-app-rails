Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'

  resources :articles do
  	resources :comments
  end

  resources :users
  
  get 'signup' => 'users#new'

  get 	'login' => 'sessions#new'
  post 	'login' => 'sessions#create'
  root 	'welcome#index'
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
