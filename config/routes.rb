Rails.application.routes.draw do
  get 'scans/scan'
  post 'scans/scan'

  devise_for :users

  # Defines the root path route ("/")
  root "scans#scan"
end
