ColumbiaRepairReportPlatform::Application.routes.draw do
  resources :reports
  # map '/' to be a redirect to '/reports'
  root :to => redirect('/reports')
end
