Rails.application.routes.draw do
  resources :events do
    resources :attendees
  end

  root 'events#index'
  get '/create_event', to: 'events#new'
  get '/check_into_event', to: 'attendees#new'
  post '/check_into_event', to: 'attendees#create'
end
