Rails.application.routes.draw do


  get 'sessions/new'

  # Static Controller Routes #
  get '/home' => 'static_pages#home', :as => :home
  get '/help' => 'static_pages#help', :as => :help
  get '/about' => 'static_pages#about', :as => :about
  get '/contact' => 'static_pages#contact', :as => :contact
  # Static Controller Routes #

  # User Controller Routes #
  # get 'login' => 'users#new'
  # User Controller Routes #

  # Sessions Controller Routes #
  get    '/login' => 'sessions#new' , :as => :login
  post   '/login' => 'sessions#login'
  delete '/logout' => 'sessions#destroy', :as => :logout
  # Sessions Controller Routes #

  # Videos Controller Routes #
  get '/videos' => 'vidoes#index' , :as => :videos
  # Videos Controller Routes #

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
