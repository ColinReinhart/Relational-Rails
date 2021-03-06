Rails.application.routes.draw do
get '/', to: 'welcome#index'

get '/resorts', to: 'resorts#index'
post '/resorts', to: 'resorts#create'
get '/resorts/new', to: 'resorts#new'
get '/resorts/:id', to: 'resorts#show'
patch '/resorts/:id', to: 'resorts#update'
delete '/resorts/:id', to: 'resorts#destroy'
get '/resorts/:id/edit', to: 'resorts#edit'
get '/resorts/:id/runs', to: 'resort_runs#index'
post '/resorts/:id/runs', to: 'resort_runs#create'
get '/resorts/:id/runs/new', to: 'resort_runs#new'
get '/runs', to: 'runs#index'
get '/runs/:id', to: 'runs#show'
patch '/runs/:id', to: 'runs#update'
delete '/runs/:id', to: 'runs#destroy'

get '/runs/:id/edit', to: 'runs#edit'



end
