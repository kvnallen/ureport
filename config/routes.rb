Rails.application.routes.draw do
  resources :scripts
  get '/scripts/run/:id', to: 'scripts#run'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
