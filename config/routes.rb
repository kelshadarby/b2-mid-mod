Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'
  post '/mechanics/:mechanic_id', to: 'mechanics#create'

  get '/amusement_parks/:amusement_park_id', to: 'amusement_parks#show'
end
