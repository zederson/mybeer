Mybeers::Application.routes.draw do

  resources :users
  resources :beers

  resource :user_sessions, :only => [:create, :new, :destroy]

  root :to => "home#index"
end
