Rails.application.routes.draw do
get '/', to: 'welcome#index'

get '/resorts/:resort_id/runs', to: 'resort_runs#index'
get '/resorts', to: 'resorts#index'
get '/resorts/new', to: 'resorts#new'
get '/resorts/:id', to: 'resorts#show'
post '/resorts', to: 'resorts#create'

get '/runs', to: 'runs#index'
get '/runs/:id', to: 'runs#show'

end
