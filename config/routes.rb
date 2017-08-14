Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
  	resources :boats, only: ['index','create']
  end
end
