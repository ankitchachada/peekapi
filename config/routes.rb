Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
  	resources :boats, only: ['index','create']
  	resources :timeslots, only: ['index','create']
  	resources :assignments, only: ['index','create']
  end
end
