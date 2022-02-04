Rails.application.routes.draw do
  root to: 'landings#index'

  # Static Pages
  # NOTE: Each route is mapped manually to pages#show. The specific page/view to render is handled by adding an id param
  #   to the route, which the controller then resolves to the appropriate view.
  #noinspection RailsParamDefResolve
  get '/about', to: 'pages#show', id: 'about', as: :about
  #noinspection RailsParamDefResolve
  get '/roadmap', to: 'pages#show', id: 'roadmap', as: :roadmap
  #noinspection RailsParamDefResolve
  get '/attributions', to: 'pages#show', id: 'attributions', as: :attributions
end
