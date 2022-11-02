ColumbiaRepairReportPlatform::Application.routes.draw do
  resources :reports
  # map '/' to be a redirect to '/reports'
  root :to => 'pages#home'

  get 'report/:id/complete', to: 'reports#complete', as: :complete_report

  # routes for qrcode
  get 'qrcode', to: 'pages#qrcode_generate', as: 'qrcode'
  get 'qrcode_download', to: 'pages#qrcode_download', as: 'qrcode_download'
end
