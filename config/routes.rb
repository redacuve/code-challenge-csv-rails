Rails.application.routes.draw do
  root 'static_pages#index'
  get '/procesar', to: 'static_pages#procesar'
  post '/procesar', to: 'static_pages#procesar_csv'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
