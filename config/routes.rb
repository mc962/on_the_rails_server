Rails.application.routes.draw do
  root to: 'landings#index'

  devise_for :users

  resources :posts

  namespace :api do
    resources :posts, except: [:new, :edit]
  end


  # Static Pages
  # NOTE: Each route is mapped manually to pages#show. The specific page/view to render is handled by adding an id param
  #   to the route, which the controller then resolves to the appropriate view.
  #noinspection RailsParamDefResolve
  get '/about', to: 'pages#show', id: 'about', as: :about
  #noinspection RailsParamDefResolve
  get '/roadmap', to: 'pages#show', id: 'roadmap', as: :roadmap
  #noinspection RailsParamDefResolve
  get '/attributions', to: 'pages#show', id: 'attributions', as: :attributions

  # Routes for Error Handling
  match '/403', to: 'errors#forbidden', via: :all
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable_entity', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
