Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      post '/signup', to: 'users#create'
      resources :users, only: [:show ,:index, :update, :destroy]
      #resourcesを使うと、勝手に/api/v1/users/:idが割り当てられる
    end
  end  
end
