# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[new create destroy]
  root 'static_pages#home'
  match '/signup',  to: 'users#new',              via: 'get'
  match '/signin',  to: 'sessions#new',           via: 'get'
  match '/signout', to: 'sessions#destroy',       via: 'delete'
  match '/help',    to: 'static_pages#help',      via: 'get'
  match '/about',   to: 'static_pages#about',     via: 'get'
  match '/contact', to: 'static_pages#contact',   via: 'get'
  match '/help',    to: 'static_pages#help',      via: 'get'

  resources :authorization_keys, only: %i[new create]
  match '/authorization', to: 'authorization_keys#new',    via: 'get'
  match '/authorization', to: 'authorization_keys#create', via: 'post'
  match '/search',        to: 'searchs#new',               via: 'get'
  match '/search',        to: 'searchs#create',            via: 'post'
  match '/searchresult',  to: 'search_results#new',        via: 'get'
  match '/searchresult',  to: 'search_results#create',     via: 'post'
  match '/flightinfo',    to: 'flights_info#new',          via: 'get'
  match '/flightinfo',    to: 'flights_info#create',       via: 'post'
  match '/farefamily',    to: 'fare_families#new',         via: 'get'
  match '/farefamily',    to: 'fare_families#create',      via: 'post'
  match '/farecondition', to: 'fare_conditions#new',       via: 'get'
  match '/farecondition', to: 'fare_conditions#create',    via: 'post'
  match '/book',          to: 'bookings#new',              via: 'get'
  match '/book',          to: 'bookings#create',           via: 'post'
  match '/info',          to: 'bookings_info#new',         via: 'get'
  match '/info',          to: 'bookings_info#create',      via: 'post'
  match '/payinfo',       to: 'payments_info#new',         via: 'get'
  match '/payinfo',       to: 'payments_info#create',      via: 'post'
  match '/cancel',        to: 'cancel_bookings#new',       via: 'get'
  match '/cancel',        to: 'cancel_bookings#create',    via: 'post'
  match '/payment',       to: 'payment_bookings#new',      via: 'get'
  match '/payment',       to: 'payment_bookings#create',   via: 'post'

  resources :base_urls
  match '/base_urls',      to: 'base_urls#create',          via: 'post'

  resources :hits, only: %i[index]
  #     hits GET    /hits(.:format)                                                                          hits#index   read collection GET
  #          POST   /hits(.:format)                                                                          hits#create  create
  #  new_hit GET    /hits/new(.:format)                                                                      hits#new     pre_create      GET
  # edit_hit GET    /hits/:id/edit(.:format)                                                                 hits#edit    pre_update      GET
  #      hit GET    /hits/:id(.:format)                                                                      hits#show    read            GET
  #          PATCH  /hits/:id(.:format)                                                                      hits#update  update
  #          PUT    /hits/:id(.:format)                                                                      hits#update  update
  #          DELETE /hits/:id(.:format)                                                                      hits#destroy delete

  match '/hits/:supplier_code',           to: 'hits#show',                 via: 'get'
  match '/hits',                          to: 'hits#index',                via: 'get'
  match '/hits',                          to: 'hits#create',               via: 'post'

  resources :channels
  match '/channels',                      to: 'channels#show',             via: 'get'
  match '/channels',                      to: 'channels#index',            via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
