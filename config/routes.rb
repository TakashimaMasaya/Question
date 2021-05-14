Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # petch 'answered(/:id)', to: 'quests#answered'
  

  namespace :admin do
    resources :users
  end

  root to: 'quests#index'
  resources :quests do 
    resources :answers
    # member do
    #   patch 'answered', to: 'quests#answered'
    #   patch 'unanswered', to: 'quests#unanswered'
    # end
    get 'quests/answered' => 'quests#answered'
    get 'quests/unanswered' => 'quests#unanswered'
  end 

  
end
