Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#users controller
  get '/mypage', to: 'users#show'
  patch '/uesrs', to: 'users#change'
#users/registrations controller
  namespace :user do
    get '/unsubscribe', to: 'registrations#unsubscribe'
    get '/unsubscribe/complete', to: 'registrations#complete'
  end
#orders controller
  get '/order', to: 'orders#order'
  get '/order/confirmation', to: 'orders#confirmation'
  get '/order/complete', to: 'orders#complete'
#items controller
  root to: 'items#index'
  get '/items/:id', to: 'items#show'
#carts controller
  get '/cart', to: 'carts#index'
  post '/items/:id/cart', to: 'carts#add'
  delete '/cart/:id', to: 'carts#remove'
  delete '/cart', to: 'carts#destroy'
#reviews controller
  resources :reviews, only:[:edit, :update, :destroy]
  get '/items/:id/reviews', to: 'reviews#new'
  post '/items/:id/reviews', to: 'reviews#create'
#addresses controller
  resources :addresses, only:[:create, :update, :destroy]
#contacts controller
  resources :contacts, only:[:create, :new]

namespace :admin do
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
  patch '/uesrs', to: 'users#change'
#admins/reviews controller
  resources :reviews, only:[:index, :show, :edit, :update, :destroy]
#admins/contacts controller
  resources :contacts, only:[:index, :show, :create]
  get '/contacts/new', to: 'contacts#new'
end

end
