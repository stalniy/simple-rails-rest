Rails.application.routes.draw do
  namespace 'api' do
    resources :articles
  end
end
