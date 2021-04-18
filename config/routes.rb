Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:update]

  # post '/users/:id', to: 'users#upload_avatar', as: upload_avatar
end
