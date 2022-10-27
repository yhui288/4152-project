ColumbiaRepairReportPlatform::Application.routes.draw do
  resources :reports
  # map '/' to be a redirect to '/reports'
  root :to => 'pages#home'

  # routes for pages
  get 'qr_code_generate', to: 'pages#qr_code_generate', as: 'generate_qr_code'
  get 'qr_code_download', to: 'pages#qr_code_download', as: 'download_qr_code'
end
