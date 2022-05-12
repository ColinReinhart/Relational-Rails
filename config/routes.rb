Rails.application.routes.draw do
get '/', to: 'welcome#index'
get '/runs', to: 'runs#index'
end
