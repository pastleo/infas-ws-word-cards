Rails.application.routes.draw do
  resources :words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/start/:group', to: 'memorizing#start', as: 'start'
end
