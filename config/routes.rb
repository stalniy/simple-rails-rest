Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  get '/login' => 'admin/session#new'
  post '/login' => 'admin/session#create'
  get '/logout' => 'admin/session#destroy', as: 'logout'
  namespace 'api' do
    resources :articles
    resources :users
    post '/session', to: 'session#create'
  end
end
