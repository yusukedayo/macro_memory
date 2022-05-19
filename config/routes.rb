Rails.application.routes.draw do
  root to: 'questions#index'
  get 'questions/index'
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create edit destroy update] do
      member do
      get 'answer'
      end
    end
  end
end
