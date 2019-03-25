Rails.application.routes.draw do
  resources :searches
  resources :lpublishers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "lpublishers/filter/:scope" => "lpublishers#index", as: :filtered_lpublishers
end
