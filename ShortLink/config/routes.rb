Rails.application.routes.draw do
  root 'pages#create'
  get 'pages/create'

  get '/create' => 'pages#create'
  get '/response' => 'pages#response'
  get '/r/:code' => 'pages#r'
end
