Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get "/users", to: 'users#index', as: 'user_index'
  get '/users/:id', to: 'users#show', as: 'user_show'
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_post_index'
  post '/users/:user_id/posts', to: 'posts#create'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'user_post_show'
  post '/users/:user_id/posts/:id', to: 'comments#create'
  get '/users/:user_id/posts/:id/comments/new', to: 'comments#new', as: 'new_comment'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'like'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy'
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy'
  get "api/users/:user_id/posts", to: 'api/posts#index'
  get "api/users/:user_id/posts/:id/comments", to: 'api/posts#show'
  post "api/users/:user_id/posts/:id/comments", to: 'api/comments#create'
  post 'authenticate', to: 'authentication#authenticate'
end
