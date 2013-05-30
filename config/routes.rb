Mybeers::Application.routes.draw do


  resources :users
  resources :beers


  root :to => "home#index"
end
