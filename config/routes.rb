Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'new', to: 'qr_handlers#new'
  post 'show', to:'qr_handlers#show'
  get 'upload', to: 'qr_handlers#upload'
  post 'decode', to:'qr_handlers#decode'

  root to: 'qr_handlers#new'
end
