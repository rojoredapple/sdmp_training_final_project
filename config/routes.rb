Rails.application.routes.draw do
  resources :events do
    resources :attendees
  end

  root 'events#index'
  get 'attendees/new'
  get 'events/new'
end
