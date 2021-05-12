Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/answered', to: 'quests#answered'
  post '/unanswered', to: 'quests#unanswered'

  namespace :admin do
    resources :users
  end

  root to: 'quests#index'
  resources :quests do 
    resources :answers
  end 
end
