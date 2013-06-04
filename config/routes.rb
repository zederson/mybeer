Mybeers::Application.routes.draw do

  resources :users
  resources :beers do
    resources :reviews, :only => [:create, :update], :modulo => :beers
  end

  resource :user_sessions, :only => [:create, :new, :destroy]

  root :to => "home#index"
end
