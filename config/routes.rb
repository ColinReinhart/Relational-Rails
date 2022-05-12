Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/runs', to: 'runs#index'
get '/runs/:id', to: 'runs#show'
end
