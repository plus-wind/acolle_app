Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#users controller
  get '/mypage', to: 'users#show'
  patch '/users', to: 'users#change'
#users/registrations controller
  devise_scope :user do
    # get "sign_up", :to => "users/registrations#new"
    # get "sign_in", :to => "users/sessions#new"
    # get "sign_out", :to => "users/registrations#destroy"
    get 'users/unsubscribe', to: 'users/registrations#unsubscribe'
    get 'users/unsubscribe/complete', to: 'users/registrations#complete'
  end
#orders controller
  get '/order', to: 'orders#order'
  post '/order/confirmation', to: 'orders#confirmation'
  put '/order/confirmation', to: 'orders#create'
  post '/order', to: 'orders#create'
  get '/order/complete', to: 'orders#complete'
#items controller
  # resources :items, only:[:show]  #下に移動してあります！！！！！！！！！
  post '/search',  to: 'items#search'
  root to: 'items#index'
#carts controller
  get '/cart', to: 'carts#index'
  # post '/items/:id/cart', to: 'carts#add'   #下に移動してあります！！！！！！！！
  post '/cart', to: 'carts#add'
  patch '/cart/:id', to: 'carts#update'
  delete '/cart.:id', to: 'carts#remove'
  delete '/carts', to: 'carts#destroy'
#reviews controller
resources :reviews, only:[:edit, :update, :destroy]
resources :items, only:[:show] do
  resources :reviews, only:[:new, :create]
end
  # get '/items/:id/reviews', to: 'reviews#new'
  # post '/items/:id/reviews', to: 'reviews#create'
#addresses controller
  resources :addresses, only:[:create, :update, :destroy, :change]
  get '/address/change', to: 'addresses#change'
#contacts controller
  resources :contacts, only:[:create, :new]

namespace :admins do
#admins/orders controller
  get '/orders', to: 'orders#index'
  patch '/orders/:id', to: 'orders#change'
#admins/items controller
  resources :items, only: [:index, :show, :edit, :update, :new, :create]
  patch '/items/:id', to: 'items#change'
#admins/arrivals controller
  resources :arrivals, only:[:index, :edit, :update, :destroy]
  post '/items/:id/arrivals', to: 'arrivals#create'
#admins/users controller
  resources :users, only:[:index, :show, :edit, :update]
  post '/search',  to: 'users#search'
  #patch '/uesrs', to: 'users#change'
#admins/reviews controller
  resources :reviews, only:[:index, :show, :edit, :update, :destroy]
#admins/contacts controller
  resources :contacts, only:[:index, :show, :create]
  get '/contacts/new', to: 'contacts#new'
end

end
