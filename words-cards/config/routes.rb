Rails.application.routes.draw do
  resources :words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/start/:group', to: 'memorizing#start', as: 'start'
  get '/continue/:group', to: 'memorizing#continue', as: 'continue'
  get '/answer/:group/:word_id', to: 'memorizing#answer', as: 'answer'
end
