Willsdata::Application.routes.draw do
  root "willsdata#index"

  get "/willsdata", to: "willsdata#index"
  get "/about", to: "about#index"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'members#new'
  post '/members' => 'members#create'
  get "/posts/:id", to: "willsdata#show"
  get "/posts/:id/edit", to: "willsdata#edit"
  get "/posts/:id", to: "willsdata#destroy"
  get "/posts/new", to: "willsdata#new"
  resources :members do
    get '/page/:page', action: :index, on: :collection
  end
  resources :posts
end
