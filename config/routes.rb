ColumbiaRepairReportPlatform::Application.routes.draw do
  resources :reports
  # map '/' to be a redirect to '/reports'
  root :to => 'pages#home'

  get 'report/:id/complete', to: 'reports#complete', as: :complete_report
  post 'report/:id/comment', to:'reports#addcmt', as: :addcmt_report

  # routes for qrcode
  get 'qrcode', to: 'pages#qrcode_generate', as: 'qrcode'
  get 'qrcode_download', to: 'pages#qrcode_download', as: 'qrcode_download'

  # manager routes
  resources :managers, only: [:new, :create, :edit, :update, :show, :destroy]

  # session routes
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/logout', to: 'sessions#destroy'
end
