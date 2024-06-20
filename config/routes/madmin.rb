# Below are the routes for madmin
namespace :madmin do
  resources :legislations
  resources :votes
  resources :businesses
  resources :politicians
  namespace :active_storage do
    resources :attachments
  end
  namespace :active_storage do
    resources :blobs
  end
  namespace :noticed do
    resources :notifications
  end
  namespace :active_storage do
    resources :variant_records
  end
  resources :announcements
  resources :services
  resources :users
  namespace :noticed do
    resources :events
  end
  root to: "dashboard#show"
end
