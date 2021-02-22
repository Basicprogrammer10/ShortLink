Rails.application.routes.draw do
  root 'pages#create'
  get 'pages/create'

  #get 'pages/response'
  get '/response' => 'pages#response'
end
