Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # The user can see one apartment, coming from a QR code or otherwise
  resources :apartments, only: [:index, :show] do
   resources :bookmarks, only: [:create]
  end
  # The user can see all of their bookmarks, bookmark an apartment, update or destroy a bookmark.
  # The show page is the chat window
  # Messages are nested, so that they belong to a specific chat
  resources :bookmarks, only: [:index, :update, :destroy, :show] do
    resources :messages, only: :create
  end

  # Setting edit to show up as bookmarks/:id/fit and have a fit prefix
  get 'bookmarks/:id/fit', to: 'bookmarks#edit', as: :fit

  # The user can see all of their items, create, update or destroy one item.
  resources :items, only: [:index, :create, :update, :destroy]

  # Namespace for agency representative (show all or one apartment, create, update or destro an apartment)
  namespace :agency do
    resources :apartments, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end

  get 'agency/apartments/:id/save_qr_code', to: 'agency/apartments#save_qr_code', as: 'save_qr_code'
end
