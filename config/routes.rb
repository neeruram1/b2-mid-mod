Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/amusement_parks/:id', to: 'amusement_parks#show'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:mechanic_id/rides', to: 'mechanic_rides#create'
end
