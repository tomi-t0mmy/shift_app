# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/session', to: 'session#index'
post '/session', to: 'session#create'
get '/user', to: 'user#index'
get '/user/new', to: 'user#new'
post '/user', to: 'user#create'
delete '/session/:id', to: 'session#destroy'
