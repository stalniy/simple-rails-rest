Rails.application.routes.draw do
  namespace 'api' do
    resources :articles
    resources :users
    post '/session', to: 'session#create'
  end
end
