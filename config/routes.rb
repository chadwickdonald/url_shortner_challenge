Rails.application.routes.draw do
  root "urls#new"
  resources :urls
  get '/:shortened' => 'urls#match'
end
