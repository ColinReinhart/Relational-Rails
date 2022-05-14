Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/runs', to: 'runs#index'
get '/runs/:id', to: 'runs#show'
get '/resorts/:resort_id/runs', to: 'resort_runs#index'
get '/resorts', to: 'resorts#index'
get '/resorts/:id', to: 'resorts#show'
end
