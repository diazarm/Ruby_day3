Rails.application.routes.draw do
  get '/saludo', to: 'pages#hola'
  resources :articles
end

